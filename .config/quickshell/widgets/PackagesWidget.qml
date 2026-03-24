import Quickshell
import QtQuick
import "../widgetUtils"
import "../components"

Rectangle {
    implicitWidth: 65;
    implicitHeight: 50;

    color: Packages.updates < 100
        ? Colours.backgroundAlt
        : Packages.updates < 200
            ? Colours.warn
            : Colours.alert;

    StyledText {
        anchors.centerIn: parent;
        text: " " + Packages.updates;
    }
}
