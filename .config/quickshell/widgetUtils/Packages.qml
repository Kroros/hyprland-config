pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {
    id: root;

    property int updates: 0;

    Process {
        id: checkUpdates;
        command: ["sh", "-c", "checkupdates | wc -l"];
        stdout: SplitParser {
            onRead: data => {
                updates = parseInt(data);
            }
        }
        Component.onCompleted: running = true;
    }

    Timer {
        interval: 10800000;
        running: true;
        repeat: true;
        onTriggered: {
            checkUpdates.running = true;
        }
    }
}
