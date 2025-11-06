import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme


Rectangle {
    anchors.fill: parent
    
    implicitWidth: Theme.utility_width

    color: Theme.bg_box

    radius: Theme.full

    RowLayout {
        id: layoutUtilityHub

        anchors.fill: parent
        spacing: Theme.space_1

        // CLOCK
        Item {
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: Theme.space_10

            implicitWidth: sectionClock.implicitWidth
            implicitHeight: Theme.space_8

            Clock { id: sectionClock }
        }

        // TOOLS
        Item {
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: Theme.space_05

            implicitWidth: layoutTools.implicitWidth
            implicitHeight: Theme.space_8

            RowLayout {
                id: layoutTools
                anchors.fill: parent

                spacing: Theme.space_1

                ScreenshotTool {}
                ColorPickerTool {}
                ClipboardTool {}
                CloudflareWarpTool {}
            }
        }
    }
}