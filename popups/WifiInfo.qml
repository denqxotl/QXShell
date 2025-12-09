import QtQuick
import qs.theme
Popup {
  id: wifiInfoPopup
  content: Component {
    Text {
      text: "Wi-Fi Information Popup"
      color: Theme.foreground
      font.pixelSize: 16
    }
  }
}