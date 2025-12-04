// PopupManager.qml
pragma Singleton
import Quickshell
import QtQuick

Singleton {
  id: popupManager

  property var popupsList: []
  signal togglePopup()
  signal closePopup()
}