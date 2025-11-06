pragma Singleton
import QtQuick

QtObject {
    // TODO: COLORS
    property color transparent: "transparent"

    property color bg:       "#131313"
    property color bg_box:   "#1c1c1c"
    property color bg_hover: "#353535"
    property color bg_popup: "#1f1f1f"

    property color fg:       "#e2e2e2"
    property color fg_sec:   "#a9a9a9"
    property color fg_ter:   "#686868"
    // property color fg_placeholder: "#888888"

    property color border:   "#292929"

    // TODO: FONT FAMILY
    property string font_main: "Rubik"
    property string font_icon_material: "Material Symbols Rounded"
    property string font_icon_material_filled: "Material Symbols Rounded Filled"

    // TODO: SPACE
    property int space_05: 2
    property int space_1: 4
    property int space_2: 8
    property int space_3: 12
    property int space_4: 16
    property int space_5: 20
    property int space_6: 24
    property int space_7: 28
    property int space_8: 32
    property int space_9: 36
    property int space_10: 40

    // TODO: RADIUS
    property int full: 999

    // TODO: ANIMATION
    property int animation_duration: 200

    // TODO: CUSTOM
    property int bar_margin: 6
    property int bar_border: 1
    
    property int workspace_spacing: 2

    property int info_icon_size: 18

    property int lateral_section_width: 450

    property int popup_text_size: 15

    property int media_margin: 6
    property int media_width: 200

    property int utility_width: 364
}