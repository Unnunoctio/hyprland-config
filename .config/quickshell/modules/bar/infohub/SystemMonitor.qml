import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.common
import qs.services


MouseArea {
    id: root

    anchors.fill: parent
    implicitWidth: layoutSystemMonitor.implicitWidth + Theme.space_2

    hoverEnabled: true

    RowLayout {
        id: layoutSystemMonitor

        anchors.centerIn: parent
        spacing: Theme.space_2

        // RAM
        Item {
            implicitWidth: layoutRam.implicitWidth
            implicitHeight: Theme.space_8

            RowLayout {
                id: layoutRam

                anchors.fill: parent
                spacing: Theme.space_1

                Rectangle {
                    implicitWidth: Theme.space_6
                    implicitHeight: Theme.space_6

                    color: Theme.fg

                    radius: Theme.full

                    MaterialIcon {
                        anchors.centerIn: parent

                        icon: "memory"
                        color: Theme.bg_box
                        size: Theme.info_icon_size
                        is_filled: true
                    }
                }

                Rectangle {
                    implicitWidth: Theme.space_6

                    StyledText {
                        anchors.centerIn: parent
                        text: Math.round(SystemInfo.memory_used_percentage * 100)
                    }
                }
            }
        }

        //CPU
        Item {
            implicitWidth: layoutCpu.implicitWidth
            implicitHeight: Theme.space_8

            RowLayout {
                id: layoutCpu

                anchors.fill: parent
                spacing: Theme.space_1

                Rectangle {
                    implicitWidth: Theme.space_6
                    implicitHeight: Theme.space_6

                    color: Theme.fg

                    radius: Theme.full

                    MaterialIcon {
                        anchors.centerIn: parent

                        icon: "planner_review"
                        color: Theme.bg_box
                        size: Theme.info_icon_size
                    }
                }

                Rectangle {
                    implicitWidth: Theme.space_6

                    StyledText {
                        anchors.centerIn: parent
                        text: Math.round(SystemInfo.cpu_usage * 100)
                    }
                }
            }
        }
    }

    SystemMonitorPopup {}
}

