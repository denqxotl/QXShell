import Quickshell
import QtQuick
import qs.bar.left
import qs.bar.right
import qs.popups

PanelWindow {
  property var vscreen
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
    implicitHeight: 50
    radius: 12
    color: "#282A36"
    opacity: 0.9
    anchors {
      margins: 8
      bottomMargin: 0
    }
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
}