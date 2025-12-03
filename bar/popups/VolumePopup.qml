import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import "../../widgets"

Popup {
  id: volumePopup
  content: Component {
    Column {
      spacing: 12
      Text {
        text: "Volume Popup Content"
        font.pixelSize: 16
        font.bold: true
        color: "white"
      }
    }
  }
}