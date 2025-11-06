import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.modules.common
import qs.services
import qs.theme


Rectangle {
    id: clipboardTool

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
            if (popupClipboard.active) return popupClipboard.active = false

            Clipboard.load()
            popupClipboard.active = true
        }

        onEntered: {
            parent.color = Theme.bg_hover
        }

        onExited: {
            parent.color = Theme.transparent
        }
    }

    ClipboardPopup { id: popupClipboard }
}