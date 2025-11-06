pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland


Item {
    property bool isConnected: false
    property bool isTransitioning: true
    property bool initialCheckDone: false

    Process {
        id: statusChecker
        // command: ["sh", "-c", "warp-cli status 2>/dev/null | grep -q 'Status update: Connected' && echo connected || echo disconnected"]
        command: ["sh", "-c", "warp-cli status 2>/dev/null"]

        stdout: StdioCollector {
            onStreamFinished: {
                var txtSplit = this.text.trim().split("\n")
                var status = txtSplit[0].split(": ")[1]
                var reason = txtSplit[1]?.split(": ")[1] ?? null

                var newConnected = (status === "Connected")

                if (!initialCheckDone) {
                    isConnected = newConnected
                    initialCheckDone = true
                    isTransitioning = false
                } else if (isConnected !== newConnected) {
                    isConnected = newConnected
                    isTransitioning = false
                } else if (reason === "No Network") {
                    isConnected = false
                    isTransitioning = false
                }
            }
        }
        
        running: false
    }

    Timer {
        id: statusPollTimer
        interval: 500
        repeat: true
        running: isTransitioning

        onTriggered: statusChecker.running = true
    }

    function toggleWarp() {
        if (isTransitioning) return

        isTransitioning = true
        if (isConnected) {
            Hyprland.dispatch("exec warp-cli disconnect")
        } else {
            Hyprland.dispatch("exec warp-cli connect")
        }

        statusPollTimer.start()
    }

    function checkStatus() {
        statusChecker.running = true
    }

    Component.onCompleted: {
        checkStatus()
    }
}