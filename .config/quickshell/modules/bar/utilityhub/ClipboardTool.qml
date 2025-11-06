import Quickshell
import Quickshell.Hyprland
import QtQuick

import qs.modules.common
import qs.theme


Rectangle {
    implicitWidth: Theme.space_7
    implicitHeight: Theme.space_7

    color: Theme.transparent

    radius: Theme.full

    MaterialIcon {
        anchors.centerIn: parent

        icon: "content_paste"
        size: Theme.space_5
        is_filled: true
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: {
            // Hyprland.dispatch("exec hyprpicker -a -n -r")
        }

        onEntered: {
            parent.color = Theme.bg_hover
        }

        onExited: {
            parent.color = Theme.transparent
        }
    }
}