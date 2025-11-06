import Quickshell
import Quickshell.Hyprland
import QtQuick

import qs.modules.common
import qs.services
import qs.theme


Rectangle {
    implicitWidth: Theme.space_7
    implicitHeight: Theme.space_7

    color: Theme.transparent

    radius: Theme.full

    MaterialIcon {
        id: iconWarp
        anchors.centerIn: parent

        icon: {
            if (WarpStatus.isTransitioning) return "autorenew"
            if (WarpStatus.isConnected) return "cloud_lock"
            return "cloud_off"
        }
        size: Theme.space_5
        is_filled: WarpStatus.isConnected

        rotation: 0

        NumberAnimation on rotation {
            running: WarpStatus.isTransitioning
            loops: Animation.Infinite
            from: 0
            to: 360
            duration: 1000
        }
    }

    Binding {
        target: iconWarp
        property: "rotation"
        value: 0
        when: !WarpStatus.isTransitioning
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: {
            WarpStatus.toggleWarp()
        }

        onEntered: {
            parent.color = Theme.bg_hover
        }

        onExited: {
            parent.color = Theme.transparent
        }
    }
}