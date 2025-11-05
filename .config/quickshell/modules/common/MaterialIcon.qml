import Quickshell
import QtQuick

import qs.theme


Text {
    property string icon       : ""
    property bool   is_filled  : false
    property int    size       : Theme.space_4

    text: icon
    color: Theme.fg
    font.pixelSize: size
    font.family: {
        if (is_filled) {
            return Theme.font_icon_material_filled
        } else {
            return Theme.font_icon_material
        }
    }
}