import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.common


Rectangle {
    anchors.fill: parent
    
    implicitWidth: Theme.lateral_section_width
    
    color: Theme.transparent
    
    radius: Theme.full

    MaterialIcon {
        id: iconAi

        anchors.verticalCenter: parent.verticalCenter
        x: Theme.space_4

        icon: "network_intelligence"
        size: Theme.space_8
    }

    MouseArea {
        anchors.fill: parent
        
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            console.log("Abrir menu lateral")
        }

        onEntered: {
            iconAi.icon = "network_intel_node"
        }

        onExited: {
            iconAi.icon = "network_intelligence"
        }
    }
}