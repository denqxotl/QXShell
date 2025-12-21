import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    Keys.onEscapePressed: Qt.quit()
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    ColumnLayout {
        TextField {
            id: input
            Layout.fillWidth: true
            placeholderText: "Run…"
            focus: true
            onTextChanged: {}

            Keys.forwardTo: input
        }
    }
}
