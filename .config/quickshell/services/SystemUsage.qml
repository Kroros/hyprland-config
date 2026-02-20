pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuUsage;
    property real cpuTemp;
    property real gpuUsage;
    property real gpuTemp;
    property real memUsed;
    property real memTotal;
    readonly property real memPerc: memTotal > 0 ? memUsed / memTotal : 0;
    property real storageUsed;
    property real storageTotal;
    readonly property real storagePerc: storageTotal > 0 ? storageUsed / storageTotal : 0;

    property real lastCpuTotal;
    property real lastCpuIdle;

    Process {
        id: cpuStat
        command: ["sh", "-c", "head -1 /proc/stat"];
        stdout: SplitParser {
            onRead: data => {
                if (!data) return;
                const p = data.trim().split(/\s+/);
                const idle = parseInt(p[4]) + parseInt(p[5] ?? 0);
                const total = p.slice(1,8).reduce((a,b) => a + parseInt(b), 0);

                const totalDiff = total - root.lastCpuTotal;
                const idleDiff = idle - root.lastCpuIdle;
                root.cpuUsage = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;

                root.lastCpuTotal = total;
                root.lastCpuIdle = idle;
            }
        }
        Component.onCompleted: running = true;
    }

    Timer {
        interval: 3000;
        running: true;
        repeat: true;
        onTriggered: {
            cpuStat.running = true;
        }
    }
}
