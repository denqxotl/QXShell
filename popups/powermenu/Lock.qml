import Quickshell.Io
import QtQuick
import "../../components"

Item {
  id: lockButton
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter

  property var process: Process {
    command: ["sh", "-c", "hyprctl dispatch exec hyprlock"]
  }

  HoverableBackground {
    id: hoverBackground
    anchors.centerIn: parent
    onClick: () => {
      lockButton.process.startDetached()
    }

    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: "../../static/lock.svg"
          width: 30
          height: 30
          fillMode: Image.PreserveAspectFit
          sourceSize: Qt.size(30, 30)
        }
      }
    }
  }
}