import Quickshell
import QtQuick
import "left"
import "right"
import "popups"

Item {
  id: barRoot
  property var vscreen

  PanelWindow {
    id: barItem
    implicitHeight: 50
    color: "transparent"
    screen: vscreen
    anchors {
      left: true
      right: true
      top: true
    }

    Rectangle {
      anchors.fill: parent
      radius: 12
      color: "#282A36"
      Left {
        anchors {
          left: parent.left
          verticalCenter: parent.verticalCenter
          leftMargin: 12
        }
      }
      Right {
        anchors {
          right: parent.right
          verticalCenter: parent.verticalCenter
          rightMargin: 12
        }
      }
    }

    PowerMenu {
      id: powerMenuPopup
      anchor.window: barItem
    }

    TrayPopup {
      id: trayPopup
      anchor.window: barItem
    }
    LayoutPopup {
      id: layoutPopup
      anchor.window: barItem
    }

    VolumePopup {
      id: volumePopup
      anchor.window: barItem
    }
  }
}