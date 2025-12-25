pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
	id: root
	signal sinkAudioChanged(real percent, bool muted)
	signal sourceAudioChanged(real percent, bool muted)
	readonly property PwNode sink: Pipewire.defaultAudioSink
	readonly property PwNode source: Pipewire.defaultAudioSource

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Process { id: process }

	Connections {
		target: root.sink?.audio ?? null

		function onVolumeChanged() {
			var percent = root.sink?.audio.volume * 100 ?? 0
			var muted = root.sink?.audio.muted ?? true
			root.sinkAudioChanged(percent, muted)
		}

		function onMutedChanged() {
			var percent = root.sink?.audio.volume * 100 ?? 0
			var muted = root.sink?.audio.muted ?? true
			root.sinkAudioChanged(percent, muted)
		}
	}

	Connections {
		target: root.source?.audio ?? null

		function onVolumeChanged() {
			var percent = root.source?.audio.volume * 100 ?? 0
			var muted = root.source?.audio.muted ?? true
			root.sourceAudioChanged(percent, muted)
		}

		function onMutedChanged() {
			var percent = root.source?.audio.volume * 100 ?? 0
			var muted = root.source?.audio.muted ?? true
			root.sourceAudioChanged(percent, muted)
		}
	}

	function script(device) {
		if(!process.running) process.exec(["sh", "-c", `~/.config/niri/scripts/audio.nu ${device}`])
	}
}
