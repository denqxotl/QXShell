import Quickshell.Hyprland
import QtQuick
import qs.components

Item {
  id: clockRoot
  implicitHeight: workspacesRow.implicitHeight
  implicitWidth: workspacesRow.implicitWidth
  property var vscreen
  anchors.verticalCenter: parent.verticalCenter

  Row {
    id: workspacesRow
    spacing: 6
    Repeater {
      model: Hyprland.workspaces
      delegate: QXButton {
        forcedColor: (modelData.active && Hyprland.focusedMonitor != null && modelData.monitor.name === Hyprland.focusedMonitor.name) ? "#6272a4" : null
        forcedRadius: modelData.active ? 12 : null
        visible: !modelData.monitor || (bar.vscreen && modelData.monitor.name === bar.vscreen.name)
        onClick: () => {
          if (modelData.active) return;
          Hyprland.dispatch("workspace " + modelData.id)
        }
        content: Component {
          Text {
            id: workspaceText
            text: modelData.name
            font.pixelSize: 14
            color: "#F8F8F2"
          }
        }
        anchors.verticalCenter: parent.verticalCenter
      }
    }
  }
}
//F8F8F2