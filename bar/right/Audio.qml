import QtQuick
import Quickshell.Io
import "../../widgets"

Item {
  id: volumeRoot
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter

  property var outputValue: "--%"

  Process {
    id: getOutputVolume
    running: false
    command: ["sh","-c","pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%'"]
    stdout: SplitParser {
      onRead: (data) => {
        if(data.trim() === "") return;
        outputValue = data + "%";
        getOutputVolume.running = false;
      }
    }
  }

  Timer {
    interval: 100
    running: true
    repeat: true
    onTriggered: {
      getOutputVolume.running = true;
    }
  }


  HoverableBackground {
    id: hoverBackground
    onClick: () => {
      var point = volumeRoot.mapToItem(null, 0, 0);
      volumePopup.toggle('right', point.x + volumeRoot.width | 0, point.y);
    }
    anchors.centerIn: parent
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: "../../static/audio.svg"
          width: 20
          height: 20
          fillMode: Image.PreserveAspectFit
        }

        Text {
          id: layoutText
          text: outputValue
          font.pixelSize: 11
          color: "white"
        }
      }
    }
  }
}