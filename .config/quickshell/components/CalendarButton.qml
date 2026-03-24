pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    id: button;
    property string day;
    property int isToday;

    Layout.fillWidth: false;
    Layout.fillHeight: false;
    implicitWidth:  40;
    implicitHeight: 40;

    background: Rectangle {
        color: (isToday == 1) ? Colours.primary : "transparent";
        radius: 10
    }

    contentItem: StyledText {
        anchors.fill: parent;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        text: day;
        color: (isToday == 1) ? Colours.foregroundDark :
            (isToday == 0) ? Colours.foreground :
            Colours.disabled;
    }
}
