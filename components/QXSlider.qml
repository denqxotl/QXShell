import Quickshell
import QtQuick
import QtQuick.Controls
import qs.theme

// TODO: this component isn't ready for use yet
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