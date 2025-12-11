// Wallpaper.qml
import Quickshell
import QtQuick
import Quickshell.Wayland
import qs.theme

PanelWindow {
    id: wallpaper
    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.exclusiveZone: 1
    property var vscreen

    screen: vscreen
    implicitHeight: vscreen.height
    implicitWidth: vscreen.width

    color: Theme.transparent

    Rectangle {
        anchors.fill: parent
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: Theme.wallpaperPath
        }
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: handleMouseEvent
        }
    }

    function handleMouseEvent(mouse) {
        switch (mouse.button) {
        case Qt.RightButton:
            break;
        case Qt.LeftButton:
            break;
        default:
            break;
        }
    }
}
