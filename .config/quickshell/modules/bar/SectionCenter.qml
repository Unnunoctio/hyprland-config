import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.bar.infohub
import qs.modules.bar.utilityhub
import qs.modules.bar.workspaces


RowLayout {
    anchors.fill: parent
    spacing: Theme.space_2

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
    Item {
        implicitWidth: sectionUtilityHub.implicitWidth
        implicitHeight: Theme.space_8

        UtilityHub{ id: sectionUtilityHub }
    }
}