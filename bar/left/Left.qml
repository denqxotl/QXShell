import QtQuick
import Quickshell
import qs.theme

Item {
  id: leftContainerRoot
  anchors.right: parent.left
  anchors.verticalCenter: parent.verticalCenter
  property var vscreen
  width: leftContainer.width
  height: leftContainer.height

  Rectangle {
    id: leftContainer
    width: leftRow.width
    height: leftRow.height
    color: Theme.transparent

    Row {
      id: leftRow
      spacing: 5
      anchors.verticalCenter: parent.verticalCenter
      anchors.left: parent.left
      Arch { vscreen: vscreen }
      Workspaces { vscreen: vscreen }
    }
  }
}