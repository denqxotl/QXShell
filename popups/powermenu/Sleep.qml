import Quickshell
import Quickshell.Io
import QtQuick
import qs
import qs.components


Item {
  id: sleepButton
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth
  property var powerMenuPopup

  anchors.verticalCenter: parent.verticalCenter

  property var process: Process {
    command: ["sh", "-c", "systemctl suspend"]
  }

  QXButton {
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
          source: Static.getStaticFile("sleep.svg")
          width: 30
          height: 30
          sourceSize: Qt.size(30, 30)
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}