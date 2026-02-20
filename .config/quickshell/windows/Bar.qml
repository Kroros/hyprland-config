import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import "../widgets"
import "../components"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            property string screenPos: {
                switch (screen.name) {
                case "DP-1": return "main";
                case "DP-2": return "left";
                case "HDMI-A-1": return "right";
                }
            }

            color: "#00000000"

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 10
                left: 10
                right: 10
            }

            implicitHeight: 50

            Rectangle{
                anchors.fill: parent
                color: Colours.background
                radius: 10

                RowLayout {
                    anchors.rightMargin: 12
                    anchors.leftMargin: 12

                    id: barRow
                    anchors.fill: parent

                    //LeftBarWidgets{}
                    //CenterBarWidgets{}
                    //RightBarWidgets{}

                    RowLayout {
                        id: leftBarWidgets;
                        Layout.alignment: Qt.AlignLeft;

                        MPlayerWidget {}

                        //CircProg {
                        //    value: 1.0;
                        //    size: 50;
                        //    strokeWidth: 5;
                        //}
                    }

                    RowLayout {
                        id: centerBarWidgets;

                        anchors.centerIn: parent;

                        WorkspacesWidget {}
                    }

                    RowLayout {
                        id: rightBarWidgets;
                        Layout.alignment: Qt.AlignRight;

                        WeatherWidget {}
                        PackagesWidget { visible: screenPos == "left" }
                        CpuWidget { visible: screenPos == "right" }
                        NetworkWidget {}
                        DateTimeWidget {}
                    }
                }
            }
        }
    }
}
