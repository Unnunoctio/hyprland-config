import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.bar.workspaces
import qs.modules.bar.infohub


RowLayout {
    anchors.fill: parent
    spacing: 0

    // INFO
    Item {
        implicitWidth: sectionInfoHub.implicitWidth
        implicitHeight: Theme.space_8
        
        InfoHub{ id: sectionInfoHub }
    }
    // WORKSPACES
    Item {
        implicitWidth: sectionWorkspaces.implicitWidth
        implicitHeight: Theme.space_8

        Workspaces{
            id: sectionWorkspaces
            workspaces_count: 7
        }
    }
    // UTILITIES
    // Item {}
}