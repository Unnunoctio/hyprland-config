pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Mpris


Singleton {
	id: root

	// Player active: el primero disponible o el que este reproduciendo
	property MprisPlayer activePlayer: {
		for (const p of Mpris.players.values) {
			if (p.playbackState === MprisPlaybackState.Playing) return p
		}
		return Mpris.players.values[0] ?? null
	}

	// Mantener el player activo actualizado
	Instantiator {
		model: Mpris.players

		Connections {
			required property MprisPlayer modelData
			target: modelData

			function onPlaybackStateChanged() {
				if (modelData.playbackState === MprisPlaybackState.Playing) {
					root.activePlayer = modelData
				} else if (root.activePlayer === modelData && modelData.playbackState !== MprisPlaybackState.Playing) {
					// Si el player actual deja de reproducir, cambiar al siguiente
					for (const p of Mpris.players.values) {
						if (p.playbackState === MprisPlaybackState.Playing) {
							root.activePlayer = p
							return
						}
					}
					root.activePlayer = Mpris.players.values[0] ?? null
				}
			}

			Component.onDestruction: {
				if (root.activePlayer === modelData) {
					root.activePlayer = Mpris.players.values[0] ?? null
				}
			}
		}
	}

	// Acciones
	function togglePlaying() {
		if (activePlayer && activePlayer.canTogglePlaying) {
			activePlayer.togglePlaying()
		}
	}

	function positionChanged() {
		// Se usa en el componente para forzar la actualizacion visual, no hace nada mas
	}
}