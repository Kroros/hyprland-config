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

            color: "#00000000"

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 20
                left: 20
                right: 20
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

                    LeftBarWidgets{}
                    CenterBarWidgets{}
                    RightBarWidgets{}
                }
            }
        }
    }
}
