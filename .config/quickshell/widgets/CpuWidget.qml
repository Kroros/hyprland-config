import Quickshell
import QtQuick
import QtQuick.Layouts
import "../services"
import "../components"

Rectangle {
    implicitWidth: 65;
    implicitHeight: 50;
    color: "#00000000";

    StyledText {
        anchors.centerIn: parent;

        text: " " + Math.round( 100 * SystemUsage.cpuUsage) + "%";
        color: Colours.primary;
    }

    MouseArea {
        anchors.fill: parent;

    }

}
