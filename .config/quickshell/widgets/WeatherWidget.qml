import Quickshell
import QtQuick
import QtQuick.Layouts
import "../widgetUtils"
import "../components"

Rectangle {
    implicitWidth: 110;
    RowLayout {
        anchors.centerIn: parent;

        StyledText {
            font.family: "Weather Icons";
            text: Weather.weather;
        }
        StyledText {
            text: Weather.temperature;
        }
    }
}
