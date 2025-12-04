import QtQuick
import "../../components"

Item {
  id: clockRoot
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter

  HoverableBackground {
    id: hoverBackground
    anchors.centerIn: parent
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: "../../static/system_monitor.svg"
          width: 20
          height: 20
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}