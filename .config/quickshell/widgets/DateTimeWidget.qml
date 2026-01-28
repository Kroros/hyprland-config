import QtQuick
import QtQuick.Layouts
import "../widgetUtils"
import "../components"

ColumnLayout {
    spacing: 1

    implicitWidth: 100


    StyledText {
        Layout.alignment: Qt.AlignRight
        text: DateTime.date
        color: Colours.primary
        font.pixelSize: 16
    }
    StyledText {
        Layout.alignment: Qt.AlignRight
        text: DateTime.time
        color: Colours.primary
        font.pixelSize: 16
    }
}
