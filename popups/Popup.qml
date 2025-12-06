import Quickshell
import QtQuick
import qs
import qs.theme

PopupWindow {
  id: popup
  visible: false
  color: Theme.transparent
  property alias content: content.sourceComponent
  property var x
  property var y
  property string position: 'left'
  anchor.rect.x: x || 1
  anchor.rect.y: y || 1

  implicitWidth: popupRect.implicitWidth
  implicitHeight: visible ? popupRect.implicitHeight : 1

  function toggle(position, x, y) {
    PopupManager.popUpClicked(popup)
    popup.x = getPositionX(position, x)
    popup.y = bar.height + 3
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
    opacity: 0.9
    color: Theme.background
    radius: 12
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