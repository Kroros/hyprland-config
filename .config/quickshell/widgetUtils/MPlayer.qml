pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root;

    property string player: "spotify";
    property string title;
    property string artist;
    property string album;
    property int length;
    property int progress;
    property string pauseStat;
    property string loopStat;
    property string shuffleStat;

    Process {
        id: metaDataProc;

        command: ["playerctl",
                  "--follow",
                  "-p",
                  root.player,
                  "metadata",
                  "--format",
                  "{{title}},{{artist}},{{album}},{{mpris:length}}"];
        running: true;

        stdout: SplitParser {
            onRead: data => {
                var info = data.split(",");
                root.title = info[0];
                root.artist = info[1];
                root.album = info[2];
                root.length = Math.round(info[3] / 1000000);
            }
        }
    }

    Process {
        id: posProc;

        command : ["playerctl",
                   "-p",
                   player,
                   "position"];

        running: true;
        stdout: SplitParser {
            onRead: data => {
                root.progress = Math.round(data);
            }
        }
    }

    Timer {
        interval: 500;
        repeat: true;
        running: true;
        onTriggered: posProc.running = true;
    }

    Process {
        id: playPauseStat;

        command: ["playerctl",
                  "--follow",
                   "-p",
                   player,
                   "status"];

        running: true;
        stdout: SplitParser {
            onRead: data => {
                root.pauseStat = data;
            }
        }
    }

    Process {
        id: shuffStat;

        command: ["playerctl",
                  "--follow",
                   "-p",
                   player,
                   "shuffle"];

        running: true;
        stdout: SplitParser {
            onRead: data => {
                root.shuffleStat = data;
            }
        }
    }

    Process {
        id: loopStatus;

        command: ["playerctl",
                  "--follow",
                   "-p",
                   player,
                   "loop"];

        running: true;
        stdout: SplitParser {
            onRead: data => {
                root.loopStat = data;
            }
        }
    }
}
