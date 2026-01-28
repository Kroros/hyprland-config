import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../components"
import "../widgetUtils"

RowLayout {
    spacing: 4

    Repeater {
        model: 10

        Rectangle {
            id: wsButton;

            implicitWidth: 45;
            implicitHeight: 50;

            property bool hovered: false;
            property int ws: index + 1;


            //color: (index + 1 == Workspaces.activeWs) ? Colours.backgroundAlt : (Workspaces.occupied.includes(index + 1) ? Colours.disabled : "#00000000");

            color: Workspaces.urgent.includes(ws) ? Colours.alert : hovered
                ? Colours.backgroundAlt
                : ws === Workspaces.activeWs
                    ? Colours.backgroundAlt
                    : Workspaces.occupied.includes(ws)
                        ? Colours.disabled
                        : "#00000000";

            StyledText {
                anchors.centerIn: parent;
                font.pixelSize: 21;
                text: Workspaces.icons[index];
            }

            Rectangle {
                id: bottomBorder;
                implicitHeight: 3;
                implicitWidth: 45;
                y: 47

                //color: (index + 1 == Workspaces.activeWs) ? Colours.secondary : (Workspaces.occupied.includes(index + 1) ? Colours.tertiary : "#00000000");
                color: Workspaces.urgent.includes(ws) ? Colours.alert : hovered
                    ? Colours.primary
                    : ws === Workspaces.activeWs
                        ? Colours.secondary
                        : Workspaces.occupied.includes(ws)
                            ? Colours.tertiary
                            : "#00000000";
            }

            MouseArea {
                anchors.fill: parent;

                hoverEnabled: true;
                onEntered: wsButton.hovered = true;
                onExited: wsButton.hovered = false;

                onClicked: {
                    Hyprland.dispatch("workspace " + ws);
                }
            }
        }
    }
}
