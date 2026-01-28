pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string date: {
        Qt.formatDateTime(time.date, "ddd d MMM")
    }
    readonly property string time: {
        Qt.formatDateTime(time.date, "HH:mm")
    }

    SystemClock {
        id: time
        precision: SystemClock.Minutes
    }
}
