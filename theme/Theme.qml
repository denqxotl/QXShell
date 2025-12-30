pragma Singleton
import QtQuick

import Quickshell

Singleton {
    property color transparent: "transparent"
    property color background: "#282A36"
    property color currentLine: "#6272A4"
    property color selection: "#44475A"
    property color foreground: "#F8F8F2"
    property color comment: "#6272A4"
    property color red: "#FF5555"
    property color orange: "#FFB86C"
    property color yellow: "#F1FA8C"
    property color green: "#50FA7B"
    property color cyan: "#8BE9FD"
    property color purple: "#BD93F9"
    property color pink: "#FF79C6"

    property int radius: 12

    property string fontFamily: "Noto Sans"
    property string wallpaperPath: "file:///home/denqxotl/Pictures/df.jpg"

    function withAlpha(c, a) {
        return Qt.rgba(c.r, c.g, c.b, a);
    }
}
