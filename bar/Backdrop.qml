// Backdrop.qml
import Quickshell
import QtQuick
import Quickshell.Wayland

PanelWindow {
  id: background
  WlrLayershell.layer: WlrLayer.Top
  property var vscreen
  visible: false
  screen: vscreen
  anchors {
    left: true
    right: true
    top: true
    bottom: true
  }

  color: "transparent"
  Rectangle {
    anchors.fill: parent
    color: "transparent"
  }

  Connections {
    target: PopupManager
  }

  MouseArea {
    propagateComposedEvents: false
    anchors.fill: parent
    hoverEnabled: true
    onClicked: {
        background.visible = false
    }
  }
}