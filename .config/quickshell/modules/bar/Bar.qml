import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme


PanelWindow {
    required property var modelData
    screen: modelData

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: Theme.bar_margin
        left: Theme.bar_margin
        right: Theme.bar_margin
    }

    implicitHeight: Theme.space_10
    
    color: Theme.transparent

    Rectangle {
        anchors.fill: parent
        
        color: Theme.bg

        border.width: Theme.bar_border
        border.color: Theme.border
        radius: Theme.full

        RowLayout {
            anchors.fill: parent
            spacing: Theme.space_4

            // -- LEFT --
            Item {
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: Theme.space_1

                implicitWidth: sectionAi.implicitWidth
                implicitHeight: Theme.space_8

                SectionAi { id: sectionAi }
            }

            // -- CENTER --
            Item {
                Layout.alignment: Qt.AlignHCenter

                implicitWidth: sectionCenter.implicitWidth
                implicitHeight: Theme.space_8

                SectionCenter { id: sectionCenter}
            }

            // -- RIGHT --
            Item {
                Layout.alignment: Qt.AlignRight

                implicitWidth: Theme.lateral_section_width
                implicitHeight: Theme.space_8

                // DATA
                Rectangle {
                    anchors.fill: parent
                    color: "#0000ff"
                }
            }
        }
    }
}