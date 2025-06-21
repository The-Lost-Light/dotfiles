import QtQuick
import Quickshell.Io

QtObject {
    id: button

    required property string text
    required property string command

    readonly property QtObject process: Process {
        command: button.command.split(/\s+/)
        onRunningChanged: if (!running) Qt.quit()
    }

    function exec() {
        process.running = true
    }
}
