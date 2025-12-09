import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import qs
import qs.components
import qs.theme

Item {
  id: volumeRoot
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  Connections {
    target: Pipewire.defaultAudioSink?.audio
    function onVolumeChanged() {
      outputValue = formatVolume(Pipewire.defaultAudioSink?.audio.volume)
    }
  }

  function formatVolume(value) {
    return Math.round((value || 0) * 100.0) + "%"
  }

  function togglePopup() {
    var point = volumeRoot.mapToItem(null, 0, 0);
    volumePopup.toggle('right', point.x + volumeRoot.width | 0, point.y);
  }

  property var outputValue: formatVolume(Pipewire.defaultAudioSink?.audio?.volume)

  QXButton {
    id: hoverBackground
    onClick: togglePopup
    anchors.centerIn: parent
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: Static.getStaticFile("audio.svg")
          width: 20
          height: 20
          fillMode: Image.PreserveAspectFit
        }

        QXText {
          text: outputValue
          font.pixelSize: 11
        }
      }
    }
  }
}