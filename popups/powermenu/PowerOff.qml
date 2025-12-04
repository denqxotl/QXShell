import QtQuick
import Quickshell.Io
import "../../components"

Item {
  id: powerOff
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth
  property var powerMenuPopup

  anchors.verticalCenter: parent.verticalCenter

  property var process: Process {
    // systemctl poweroff
    command: ["sh", "-c", "systemctl poweroff"]
  }

  HoverableBackground {
    id: hoverBackground
    anchors.centerIn: parent
    onClick: () => {
      powerMenuPopup.visible = false
      process.startDetached()
    }
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: "../../static/poweroff.svg"
          width: 30
          height: 30
          fillMode: Image.PreserveAspectFit
          sourceSize: Qt.size(30, 30)
        }
      }
    }
  }
}