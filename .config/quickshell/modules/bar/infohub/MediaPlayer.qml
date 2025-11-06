import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import qs.modules.common
import qs.services
import qs.theme


Rectangle {
    anchors.fill: parent

    implicitWidth: layoutMediaPlayer.implicitWidth + Theme.space_2

    color: Theme.transparent

    radius: Theme.full

    readonly property MprisPlayer activePlayer: MprisController.activePlayer

    Timer {
        running: activePlayer?.playbackState === MprisPlaybackState.Playing
        interval: 500
        repeat: true
        onTriggered: activePlayer.positionChanged()
    }

    RowLayout {
        id: layoutMediaPlayer
        anchors.centerIn: parent
        spacing: Theme.space_2

        Rectangle {
            implicitWidth: Theme.space_6
            implicitHeight: Theme.space_6

            color: Theme.fg

            radius: Theme.full

            MaterialIcon {
                anchors.centerIn: parent

                icon: {
                    if (activePlayer?.isPlaying) return "pause"
                    if (activePlayer?.canPause) return "play_arrow"
                    return "music_note"
                }
                color: Theme.bg_box
                size: Theme.info_icon_size
                is_filled: true
            }
        }

        StyledText {
            Layout.minimumWidth: Theme.media_width
            Layout.maximumWidth: Theme.media_width

            text: (activePlayer && activePlayer.trackTitle) ? activePlayer.trackTitle : "No media playing"
            
            elide: Text.ElideRight
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: {
            if (!activePlayer || activePlayer.trackTitle === "") return Qt.ArrowCursor
            return Qt.PointingHandCursor
        }

        onClicked: {
            if (activePlayer && activePlayer.trackTitle !== "") activePlayer.togglePlaying()
        }

        hoverEnabled: activePlayer && activePlayer.trackTitle !== ""

        onEntered: {
            parent.color = (activePlayer && activePlayer.trackTitle !== "") ? Theme.bg_hover : Theme.transparent
        }

        onExited: {
            parent.color = Theme.transparent
        }
    }
}