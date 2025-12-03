import QtQuick

QtObject {
  id: popupManager
  property bool popupActive: false
  signal togglePopup()
  signal closePopup()
}