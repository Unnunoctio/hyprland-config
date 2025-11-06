pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io


Item {
    property var clipboard_list: []

    Process {
        id: clipboardLoad
        command: ["sh", "-c", "cliphist list | head -n 20"]

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n").filter(item => item !== "")
                clipboard_list = lines.map(line => {
                    const parts = line.split("\t")
                    return {
                        id: parts[0],
                        content: parts.slice(1).join("\t")
                    }
                })
            }
        }

        running: false
    }

    Process {
        id: clipboardCopy
        command: ["sh", "-c", ""]
        running: false
    }

    function load() {
        clipboardLoad.running = true
    }

    function copy(id) {
        clipboardCopy.command = ["sh", "-c", "cliphist decode '" + id + "' | wl-copy"]
        clipboardCopy.running = true
    }
}