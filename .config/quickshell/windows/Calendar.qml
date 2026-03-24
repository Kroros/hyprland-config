//Copied heavily from end4's calendar widget
//https://github.com/end-4/dots-hyprland

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../scripts/calendarLayout.js" as CalendarLayout
import "../components"
import "../widgetUtils"

PanelWindow {
    id: root;

    implicitHeight: 400;
    implicitWidth: 400;

    property int monthShift: 0;
    property var viewingDate: CalendarLayout.getDateInXMonths(monthShift);
    property var calendarLayout: CalendarLayout.getCalendarLayout(viewingDate, monthShift === 0);

    color: "transparent";

    anchors {
        top: true;
        right: true;
    }

    margins {
        top: 10
        right: 10
    }

    Rectangle {
        anchors.fill: parent;

        color: Colours.background;
        radius: 10;


        MouseArea {
            anchors.fill: parent;
            onWheel: (event) => {
                if (event.angleDelta.y > 0) {
                    monthShift--;
                } else if (event.angleDelta.y < 0) {
                    monthShift++;
                }
            }
        }

        ColumnLayout {
            id: calendarColumn;

            anchors.centerIn: parent;

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter;

                RowLayout {

                    StyledButton {
                        Layout.alignment: Text.AlignLeft;
                        buttonText: ""
                        fgColour: Colours.primary;
                        bgColour: "transparent";
                        fontSize: 25;
                        onPressed: () => {
                            monthShift--;
                        }
                    }

                    StyledButton {
                        Layout.fillWidth: true;
                        Layout.alignment: Qt.AlignHCenter;
                        buttonText: `${viewingDate.toLocaleDateString(Qt.locale("en_GB"), "MMMM yyyy")}`;
                        //buttonText: viewingDate;
                        fontSize: 25;
                        fgColour: (monthShift == 0) ? Colours.primary : Colours.secondary;
                        bgColour: "transparent";
                        onPressed: () => {
                            monthShift = 0;
                        }
                    }

                    StyledButton {
                        Layout.alignment: Text.AlignRight;
                        buttonText: ""
                        fgColour: Colours.primary;
                        bgColour: "transparent";
                        fontSize: 25;
                        onPressed: () => {
                            monthShift++;
                        }
                    }

                }


                RowLayout {
                    id: weekDaysRow
                    Layout.alignment: Qt.AlignHCenter;
                    Layout.fillHeight: false;
                    spacing: 5;
                    Repeater {
                        model: CalendarLayout.weekDays;
                        delegate: CalendarButton {
                            day: modelData.day
                            isToday: modelData.today
                        }
                    }
                }

                Repeater {
                    id: calendarRows

                    model: 6
                    delegate: RowLayout {
                        Layout.alignment: Qt.AlignHCenter;
                        Layout.fillHeight: false;
                        spacing: 5;
                        Repeater {
                            model: Array(7).fill(modelData)
                            delegate: CalendarButton {
                                day: calendarLayout[modelData][index].day
                                isToday: calendarLayout[modelData][index].today
                            }
                        }
                    }
                }
            }
        }
    }
}
