import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import qs.theme
import qs.modules.common
import qs.services


Loader {
    id: loaderSystemMonitor
    active: parent.containsMouse

    sourceComponent: PanelWindow {
        id: windowSystemMonitor

        anchors {
            top: true
            left: true
        }

        margins {
            left: parent.QsWindow?.mapFromItem(parent, 0, 0).x - (sectionPopup.width/2) + (parent.width/2)
            top: Theme.space_10 + Theme.space_3
        }

        implicitWidth: sectionPopup.implicitWidth + Theme.space_4
        implicitHeight: sectionPopup.implicitHeight + Theme.space_4

        mask: Region {
            item: sectionPopup
        }

        WlrLayershell.namespace: "quickshell:systemMonitorPopup"
        WlrLayershell.layer: WlrLayer.Overlay

        exclusionMode: ExclusionMode.Ignore
        exclusiveZone: 0

        color: Theme.transparent

        Rectangle {
            id: sectionPopup
            anchors.centerIn: parent

            implicitWidth: contentPopup.implicitWidth + Theme.space_6
            implicitHeight: contentPopup.implicitHeight + Theme.space_6

            color: Theme.bg_popup

            border.width: Theme.bar_border
            border.color: Theme.border
            radius: Theme.space_3

            RowLayout {
                id: contentPopup
                anchors.centerIn: parent

                spacing: Theme.space_4

                // RAM
                ColumnLayout {
                    Layout.alignment: Qt.AlignTop
                    spacing: Theme.space_2

                    // Header
                    RowLayout {
                        spacing: Theme.space_2

                        MaterialIcon {
                            icon: "memory"
                            color: Theme.fg_sec
                            size: Theme.info_icon_size
                            // is_filled: true
                        }
                        StyledText {
                            text: "RAM"
                            font.weight: Font.Medium
                        }
                    }

                    // Items
                    ColumnLayout {
                        // Used
                        RowLayout {
                            spacing: Theme.space_2

                            MaterialIcon {
                                icon: "clock_loader_60"
                                color: Theme.fg_sec
                            }
                            StyledText {
                                text: "Used: " + SystemInfo.formatKB(SystemInfo.memory_used)
                                font.pixelSize: Theme.popup_text_size
                            }
                        }

                        // Free
                        RowLayout {
                            spacing: Theme.space_2
                            
                            MaterialIcon {
                                icon: "check_circle"
                                color: Theme.fg_sec
                            }
                            StyledText {
                                text: "Free: " + SystemInfo.formatKB(SystemInfo.memory_free)
                                font.pixelSize: Theme.popup_text_size
                            }
                        }

                        // Total
                        RowLayout {
                            spacing: Theme.space_2

                            MaterialIcon {
                                icon: "developer_board"
                                color: Theme.fg_sec
                            }
                            StyledText {
                                text: "Total: " + SystemInfo.formatKB(SystemInfo.memory_total)
                                font.pixelSize: Theme.popup_text_size
                            }   
                        }
                    }
                }

                // CPU
                ColumnLayout {
                    Layout.alignment: Qt.AlignTop
                    spacing: Theme.space_2

                    // Header
                    RowLayout {
                        spacing: Theme.space_2

                        MaterialIcon {
                            icon: "planner_review"
                            color: Theme.fg_sec
                            size: Theme.info_icon_size
                        }
                        StyledText {
                            text: "CPU"
                            font.weight: Font.Medium
                        }
                    }

                    // Items
                    ColumnLayout {
                        // Used
                        RowLayout {
                            spacing: Theme.space_2

                            MaterialIcon {
                                icon: "bolt"
                                color: Theme.fg_sec
                            }
                            StyledText {
                                text: {
                                    var usage = Math.round(SystemInfo.cpu_usage * 100)
                                    if (usage <= 25) return "Load: Low (" + usage + "%)"
                                    if (usage > 25 && usage <= 75) return "Load: Medium (" + usage + "%)"
                                    return "Load: High (" + usage + "%)"
                                }
                                font.pixelSize: Theme.popup_text_size
                            }
                        }
                    }
                }
            }
        }
    }
}