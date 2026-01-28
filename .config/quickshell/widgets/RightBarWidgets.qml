import Quickshell
import QtQuick
import QtQuick.Layouts
import "../widgets"

RowLayout {
    Layout.alignment: Qt.AlignRight
    WeatherWidget {}
    NetworkWidget {}
    DateTimeWidget {}
}
