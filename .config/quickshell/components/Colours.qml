pragma Singleton

import QtQml
import QtQuick

Item {
    readonly property color background: Qt.rgba(0.13, 0.15, 0.13, 0.85);
    readonly property color backgroundAlt: Qt.rgba(0.24, 0.36, 0.29, 0.85);
    readonly property color foreground: Qt.rgba(0.78, 0.78, 0.78, 1);
    readonly property color primary: Qt.rgba(0.7, 0.83, 0.46, 1);
    readonly property color secondary: Qt.rgba(0.54, 0.75, 0.72, 1);
    readonly property color tertiary: Qt.rgba(0.40, 0.54, 0.47, 1);
    readonly property color alert: Qt.rgba(0.65, 0.26, 0.32, 1);
    readonly property color alertAlt: Qt.rgba(0.82, 0.25, 0.35, 1);
    readonly property color disabled: Qt.rgba(0.20, 0.25, 0.20, 1);
    readonly property color border: Qt.rgba(0.27, 0.80, 0.27, 1);
}
