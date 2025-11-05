import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.theme


Rectangle {
    property int workspaces_count: 10

    anchors.fill: parent
    
    implicitWidth: layoutWorkspaces.implicitWidth + Theme.space_2

    color: Theme.bg_box

    radius: Theme.full

    RowLayout {
        id: layoutWorkspaces
        anchors.centerIn: parent

        spacing: Theme.workspace_spacing

        Repeater {
            model: workspaces_count

            Rectangle {
                width: Theme.space_6
                height: Theme.space_6

                radius: Theme.full

                property bool is_active: {
                    var monitor = Hyprland.focusedMonitor
                    return monitor && monitor.activeWorkspace && monitor.activeWorkspace.id === (index + 1)
                }

                property bool has_windows: {
                    var workspaces = Hyprland.workspaces
                    for (var i = 0; i < workspaces.values.length; i++) {
                        if (workspaces.values[i].id === (index + 1)) {
                            return workspaces.values[i].toplevels.values.length > 0
                        }
                    }
                    return false
                }

                color: {
                    if (is_active) return Theme.fg
                    if (has_windows) return Theme.bg_hover
                    return Theme.transparent
                }

                Behavior on color {
                    ColorAnimation {
                        duration: Theme.animation_duration
                    }
                }

                Rectangle {
                    anchors.centerIn: parent

                    width: Theme.space_1
                    height: Theme.space_1

                    radius: Theme.full

                    color: {
                        if (is_active) return Theme.bg_box
                        if (has_windows) return Theme.fg
                        return Theme.fg_ter
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: Theme.animation_duration
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }
    }
}