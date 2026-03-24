pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

Button {
    id: button
    property string buttonText: "";
    property int fontSize: 17;
    property color bgColour: Colours.background;
    property color fgColour: Colours.foreground;

    implicitHeight: 30;
    implicitWidth: 30;

    background: Rectangle {
        color: bgColour;
    }

    contentItem: StyledText {
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;

        text: buttonText;
        font.pixelSize: fontSize;
        color: fgColour;
    }
}
