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

    readonly property string screenshot_dir: Quickshell.env("HOME") + "/Pictures/Screenshots"

    function screenshot() {
        var timestamp = Qt.formatDateTime(new Date(), "yyyy-MM-dd_HH-mm-ss")
        var file_name = screenshot_dir + "/screenshot_" + timestamp + ".png"

        Hyprland.dispatch("exec grimblast --notify copysave area " + file_name) // Captura de area
        // Hyprland.dispatch("exec grimblast --notify copysave screen " + filename) // Captura de pantalla completa
        // Hyprland.dispatch("exec grimblast --notify copysave active " + file_name) // Captura de ventana activa
    }

    MaterialIcon {
        anchors.centerIn: parent

        icon: "screenshot_region"
        size: Theme.space_5
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: {
            screenshot()
        }

        onEntered: {
            parent.color = Theme.bg_hover
        }

        onExited: {
            parent.color = Theme.transparent
        }
    }
}