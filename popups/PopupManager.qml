// PopupManager.qml
pragma Singleton
import Quickshell
import QtQuick

// TODO: implement an ability to manage multiple popups globally
Singleton {
  id: popupManager

  property var popupsList: []
  signal togglePopup()
  signal closePopup()
  signal backDropVisibleChanged(bool visible)

  function popUpClicked(popup) {
    if( popupsList.indexOf(popup) === -1 ) {
      popupsList.push(popup)
      popup.visible = true
    } else {
      var index = popupsList.indexOf(popup)
      popupsList.splice(index, 1)
      popup.visible = false
    }
    popupManager.togglePopup()
    popupManager.backDropVisibleChanged(popupsList.length > 0)
  }

  function closeAll() {
    for( var i = 0; i < popupsList.length; i++ ) {
      popupsList[i].visible = false
    }
    popupsList = []
    popupManager.backDropVisibleChanged(false)
  }
}