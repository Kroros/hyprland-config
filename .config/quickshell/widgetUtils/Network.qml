pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property string output;

    function getState() {
        stateProc.running = true
    }

    Process {
        id: stateProc
        command: ["nmcli", "-t", "-f", "STATE", "general"]

        stdout: SplitParser {
            onRead: data => {
                root.output = data
            }
        }
    }

    Process {
        id: networkMonitor

        command: ["nmcli", "monitor"]
        running: true

        stdout: SplitParser {
            onRead: {
                getState()
            }
        }
    }
}
