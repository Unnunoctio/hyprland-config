import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.common


StyledText {
    anchors.verticalCenter: parent.verticalCenter

    property var current_time: new Date()

    text: {
        var hours = current_time.getHours()
        var minutes = current_time.getMinutes().toString().padStart(2, "0")

        var ampm = hours >= 12 ? "PM" : "AM"
        hours = hours % 12
        hours = hours ? hours : 12

        var day_names = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        var day_name = day_names[current_time.getDay()]
        var day = current_time.getDate().toString().padStart(2, "0")
        var month = (current_time.getMonth() + 1).toString().padStart(2, "0")

        return `${hours}:${minutes} ${ampm} · ${day_name}, ${day}/${month}`
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: parent.current_time = new Date()
    }
}
