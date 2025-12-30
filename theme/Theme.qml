pragma Singleton

import Quickshell

Singleton {
    property string transparent: "transparent"
    property string background: "#282A36"
    property string currentLine: "#6272A4"
    property string selection: "#44475A"
    property string foreground: "#F8F8F2"
    property string comment: "#6272A4"
    property string red: "#FF5555"
    property string orange: "#FFB86C"
    property string yellow: "#F1FA8C"
    property string green: "#50FA7B"
    property string cyan: "#8BE9FD"
    property string purple: "#BD93F9"
    property string pink: "#FF79C6"

    property int radius: 12

    property string fontFamily: "Noto Sans"
    property string wallpaperPath: "file:///home/denqxotl/Pictures/df.jpg"

    function withAlpha(c, a) {
        return Qt.rgba(c.r, c.g, c.b, a);
    }
}
