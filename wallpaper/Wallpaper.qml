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
  visible: true
  screen: vscreen
  implicitHeight: vscreen.height
  implicitWidth: vscreen.width

  color: Theme.transparent
  Rectangle {
    anchors.fill: parent
    Image {
      anchors.fill: parent
      fillMode: Image.PreserveAspectCrop
      source: "file:///home/denqxotl/Pictures/tg9.jpeg"
    }
    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton | Qt.RightButton
      onClicked: (mouse) => {
        if (mouse.button === Qt.RightButton) {
        } else if (mouse.button === Qt.LeftButton) {
        }
      }
    }
  }
}