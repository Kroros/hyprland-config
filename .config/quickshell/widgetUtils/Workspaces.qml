pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Singleton {
    id: root

    readonly property int activeWs: Hyprland.focusedWorkspace.name ?? 1;
    readonly property list<int> urgent: Hyprland.workspaces.values.filter(ws => ws.urgent).map(ws => ws.name);
    readonly property list<int> occupied: Hyprland.workspaces.values.filter(ws => ws.lastIpcObject.windows > 0).map(ws => ws.name);
    readonly property list<string> icons: ["", "", "", "", "󱨍", "", "", "", "", ""];
}
