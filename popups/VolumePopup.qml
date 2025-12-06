import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls
import qs.components
import qs.popups
import qs.theme

Popup {
  id: volumePopup
  implicitHeight: 150
  content: Component {
    Column {
      id: volumeColumn
      anchors.fill: parent
      spacing: 12
      PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
      }
      Row {
        id: volumeRow
        spacing: 8
        anchors.verticalCenter: volumePopup.verticalCenter
        Text {
          anchors.verticalCenter: volumeRow.verticalCenter
          text: ""
          font.pixelSize: 24
          color: Theme.foreground
          width: 25
        }
        Connections {
          target: Pipewire.defaultAudioSink?.audio
          function onVolumeChanged() {
            volumeSlider.volumeValue = Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0)
            volumeSlider.value = volumeSlider.volumeValue
          }
        }
        Slider {
          anchors.verticalCenter: volumeRow.verticalCenter
          property var volumeValue: Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0)
          id: volumeSlider
          width: 250
          from: 0
          to: 100
          value: volumeValue
          onValueChanged: {
            Pipewire.defaultAudioSink.audio.volume = value / 100.0
          }
          background: Rectangle {
            id: sliderBackground
            implicitWidth: 250
            implicitHeight: 20
            radius: 12
            color: Theme.currentLine
            Rectangle {
              radius: 12
              width: volumeSlider.visualPosition * parent.width
              height: parent.height
              color: Theme.purple
            }
          }
          handle: Rectangle {
            x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.width - volumeSlider.leftPadding - volumeSlider.rightPadding) - width / 2
            y: parent.height / 2 - height / 2
          }
        }
      }
      Row {
        id: microphoneRow
        spacing: 8
        anchors.verticalCenter: volumePopup.verticalCenter
        Connections {
          target: Pipewire.defaultAudioSource?.audio
          function onVolumeChanged() {
            microphoneSlider.microphoneValue = Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0)
            microphoneSlider.value = microphoneSlider.microphoneValue
          }
        }
        Text {
          anchors.verticalCenter: microphoneRow.verticalCenter
          text: "󰍬"
          width: 25
          font.pixelSize: 24
          color: Theme.foreground
        }
        Slider {
          property var microphoneValue: Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0)
          anchors.verticalCenter: microphoneRow.verticalCenter
          id: microphoneSlider
          width: 250
          from: 0
          to: 100
          value: microphoneValue
          onValueChanged: {
            Pipewire.defaultAudioSource.audio.volume = value / 100.0
          }
          background: Rectangle {
            id: sliderBackgroundMic
            implicitWidth: 250
            implicitHeight: 20
            radius: 12
            color: Theme.currentLine
            Rectangle {
              radius: 12
              width: microphoneSlider.visualPosition * parent.width
              height: parent.height
              color: Theme.purple
            }
          }
          handle: Rectangle {
            x: microphoneSlider.leftPadding + microphoneSlider.visualPosition * (microphoneSlider.width - microphoneSlider.leftPadding - microphoneSlider.rightPadding) - width / 2
            y: parent.height / 2 - height / 2
          }
        }
      }
    }
  }
}