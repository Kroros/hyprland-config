import Quickshell
import QtQuick
import "../widgetUtils"
import "../components"

Rectangle {
    property string status: Network.output;

    color: status == "connected" ? Colours.backgroundAlt : Colours.alert;

    implicitWidth: 45
    implicitHeight: 50


    StyledText {
        anchors.centerIn: parent
        font.pixelSize: 25
        text: status == "connected" ? "󰲝" : "󰱟";
    }
}
