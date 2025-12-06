import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls
import qs.components
import qs.popups
import qs.theme

Popup {
  id: volumePopup
  implicitWidth: 500
  implicitHeight: 150
  content: Component {
    Column {
      id: volumeColumn
      spacing: 12
      Row {
        id: volumeRow
        spacing: 8
        anchors.verticalCenter: parent.verticalCenter
        Text {
          text: ""
          font.pixelSize: 24
          color: Theme.foreground
          width: 25
        }
        Slider {
          id: volumeSlider
          from: 0
          to: 100
          stepSize: 1
          value: Hyprland.volume * 100
          onValueChanged: {
          }
        }
      }
      Row {
        id: microphoneRow
        spacing: 8
        anchors.verticalCenter: parent.verticalCenter
        Text {
          text: "󰍬"
          width: 25
          font.pixelSize: 24
          color: Theme.foreground
        }
        Slider {
          id: microphoneSlider
          from: 0
          to: 100
          stepSize: 1
          value: Hyprland.volume * 100
          onValueChanged: {
          }
        }
      }
    }
  }
}