import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.modules.common
import qs.services
import qs.theme


Loader {
    id: root
    active: false

    sourceComponent: PanelWindow {
        id: windowClipboard

        anchors {
            top: true
            left: true
            right: true
            bottom: true
        }

        WlrLayershell.namespace: "quickshell:clipboardPopup"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

        focusable: true

        color: Theme.transparent

        FocusScope {
            id: popupScope
            anchors.fill: parent
            focus: true

            Keys.onReleased: (event) => {
                if (event.key === Qt.Key_Escape) {
                    root.active = false
                    event.accepted = true
                }
            }

            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true

                onClicked: function(mouse) {
                    var mappedPos = mapToItem(popupContentClipboard, mouse.x, mouse.y)
                    if (!popupContentClipboard.contains(mappedPos)) {
                        popupClipboard.active = false
                        mouse.accepted = true
                    } else {
                        mouse.accepted = false
                    }
                }

                Rectangle {
                    id: popupContentClipboard

                    anchors {
                        top: parent.top
                        left: parent.left
                    }

                    anchors.topMargin: Theme.space_3
                    anchors.leftMargin: root.parent.QsWindow?.mapFromItem(root.parent, 0, 0).x - (popupContentClipboard.width/2) + (root.parent.width/2)

                    implicitWidth: sectionContentClipboard.implicitWidth + Theme.space_6
                    implicitHeight: sectionContentClipboard.implicitHeight + Theme.space_6

                    color: Theme.bg_popup

                    border.width: Theme.bar_border
                    border.color: Theme.border
                    radius: Theme.space_3

                    Item {
                        id: sectionContentClipboard
                        anchors.centerIn: parent

                        implicitWidth: layoutListClipboard.implicitWidth
                        implicitHeight: Theme.clipboard_tooltip_height

                        Flickable {
                            id: scrollClipboard
                            anchors.fill: parent
                            clip: true
                            contentHeight: layoutListClipboard.implicitHeight
                            contentWidth: layoutListClipboard.implicitWidth
                            flickableDirection: Flickable.VerticalFlick
                            boundsBehavior: Flickable.StopAtBounds

                            ScrollBar.vertical: ScrollBar {
                                policy: ScrollBar.AsNeeded
                            }

                            ColumnLayout {
                                id: layoutListClipboard

                                anchors.fill: parent

                                spacing: Theme.space_1

                                Repeater {
                                    model: Clipboard.clipboard_list

                                    Rectangle {
                                        id: itemClipboard

                                        required property int index
                                        required property var modelData

                                        Layout.alignment: Qt.AlignHCenter

                                        implicitWidth: layoutItemClipboard.implicitWidth
                                        implicitHeight: Theme.space_9

                                        color: Theme.transparent

                                        radius: Theme.space_2

                                        RowLayout {
                                            id: layoutItemClipboard

                                            anchors.verticalCenter: parent.verticalCenter

                                            StyledText {
                                                Layout.minimumWidth: Theme.clipboard_tooltip_text_width
                                                Layout.maximumWidth: Theme.clipboard_tooltip_text_width

                                                Layout.leftMargin: Theme.space_2
                                                Layout.rightMargin: Theme.space_1

                                                text: (index + 1) + ". " + modelData.content

                                                elide: Text.ElideRight
                                            }
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            hoverEnabled: true

                                            onClicked: {
                                                Clipboard.copy(modelData.id)

                                                popupClipboard.active = false
                                                Hyprland.dispatch("exec notify-send 'Copied to clipboard!'")
                                            }

                                            onEntered: {
                                                parent.color = Theme.bg_hover
                                            }

                                            onExited: {
                                                parent.color = Theme.transparent
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}