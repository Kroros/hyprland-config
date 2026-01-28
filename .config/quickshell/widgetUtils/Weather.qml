pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root;

    property string weather;
    property string temperature;

    Process {
        id: weatherProc;
        command: ["sh", "-c", "$HOME/.config/quickshell/scripts/weather.py"];

        running: true

        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var w = data.split(" ");
                var weat = w[0] + " " + w[1] + " " + w[2]
                var temp = w[3]

                root.weather = weat;
                root.temperature = temp
            }
        }
    }

    Timer {
        interval: 600000;
        running: true;
        repeat: true;

        onTriggered: weatherProc.running = true;
    }
}
