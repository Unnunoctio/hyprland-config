import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme


Rectangle {
    anchors.fill: parent
    implicitWidth: layoutInfoHub.implicitWidth

    color: Theme.bg_box
    
    radius: Theme.full

    RowLayout {
        id: layoutInfoHub

        anchors.fill: parent
        spacing: Theme.space_2

        // RAM & CPU
        Item {
            implicitWidth: sectionSystemMonitor.implicitWidth
            implicitHeight: Theme.space_8

            SystemMonitor { id: sectionSystemMonitor }
        }

        // MEDIA PLAYER
        Item {
            implicitWidth: 100
            implicitHeight: Theme.space_8

            Rectangle {
                anchors.fill: parent
                color: "#0000ff"
            }
        }
    }
}