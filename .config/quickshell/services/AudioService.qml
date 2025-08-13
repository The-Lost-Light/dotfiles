pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
	id: root
	signal sinkAudioChanged
	signal sourceAudioChanged
	readonly property PwNode sink: Pipewire.defaultAudioSink
	readonly property PwNode source: Pipewire.defaultAudioSource

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Process {
		id: process
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio ?? null

		function onVolumeChanged() {
			root.sinkAudioChanged()
		}
	}

	Connections {
		target: Pipewire.defaultAudioSource?.audio ?? null

		function onVolumeChanged() {
			root.sourceAudioChanged()
		}
	}

	function script(device) {
		if(!process.running) process.exec(["sh", "-c", `~/.config/niri/scripts/audio.nu ${device}`])
	}
}
