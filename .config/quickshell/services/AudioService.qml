pragma Singleton
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
	readonly property PwNode sink: Pipewire.defaultAudioSink
	readonly property PwNode source: Pipewire.defaultAudioSource

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Process {
		id: process
	}

	function script(device) {
		if (!process.running) process.exec(["sh", "-c", `~/.config/niri/scripts/audio.nu ${device}`])
	}
}
