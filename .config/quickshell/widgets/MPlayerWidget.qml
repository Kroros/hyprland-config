import Quickshell
import QtQuick
import QtQuick.Layouts
import "../components"
import "../widgetUtils"

Rectangle {
    id: root;
    implicitWidth: Math.max(titleText.width, artistText.width) + 50;
    implicitHeight: 50;

    color: "transparent";

    CircProg {
        value: MPlayer.progress / MPlayer.length;
        size: 50;
        strokeWidth: 5;
    }

    StyledText{
        x: 18;
        y: 7;
        color: Colours.primary;
        font.pixelSize: 25;
        text: MPlayer.pauseStat == "Paused" ? "󰏤" : "";
    }

    StyledText {
        id: titleText;
        x: 55;
        color: Colours.primary;
        text: MPlayer.title;
    }

    StyledText {
        id: artistText;
        x: 55;
        y: 25;
        color: Colours.primary;
        text: MPlayer.artist;
        font.pixelSize: 14;
    }

    MouseArea {
        anchors.fill: parent;
        cursorShape: Qt.PointingHandCursor;
    }
}
