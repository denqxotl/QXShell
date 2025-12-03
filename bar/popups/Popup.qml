import Quickshell
import QtQuick

PopupWindow {
  id: popup
  visible: false
  color: "transparent"
  property alias content: content.sourceComponent
  property var x
  property var y
  property string position: 'left'
  anchor.rect.x: x || 1
  anchor.rect.y: y || 1

  implicitWidth: popupRect.implicitWidth
  implicitHeight: visible ? popupRect.implicitHeight : 1

  function toggle(position, x, y) {
    popup.x = getPositionX(position, x)
    popup.y = barItem.height - 3
    popup.visible = !popup.visible
  }

  function getPositionX(position, x) {
    if (position === 'left') {
      return x
    } else if (position === 'right') {
      return x - popupRect.implicitWidth
    }
    return x
  }

  Rectangle {
    id: popupRect
    anchors.right: popup.position === 'right' ? parent.right : undefined
    anchors.left: popup.position === 'left' ? parent.left : undefined
    color: "#282A36"
    bottomLeftRadius: 12
    bottomRightRadius: 12
    implicitWidth: content.implicitWidth + 24
    implicitHeight: content.implicitHeight + 24
    Loader {
      id: content
      width: content.width
      anchors.fill: parent
      anchors.margins: 12
    }
  }

  Behavior on implicitHeight {
    NumberAnimation {
      duration: 50
      easing.type: Easing.InExpo
    }
  }
}