// PopupManager.qml
pragma Singleton
import Quickshell
import QtQuick

Singleton {
    id: popupManager
    property var popupsList: []
    signal togglePopup
    signal closePopup
    signal backDropVisibleChanged(bool visible)

    function popUpClicked(popup) {
        const index = popupsList.indexOf(popup);
        const isOpen = index !== -1;

        if (isOpen) {
            popupsList.splice(index, 1);
        } else {
            closeAll();
            popupsList.push(popup);
        }

        popup.visible = !isOpen;
        popupManager.togglePopup();
        popupManager.backDropVisibleChanged(popupsList.length > 0);
    }

    function closeAll() {
        popupsList.forEach(popup => popup.visible = false);
        popupsList.length = 0;
        popupManager.backDropVisibleChanged(false);
    }

    function close(popup) {
        const index = popupsList.indexOf(popup);
        const isOpen = index !== -1;

        if (isOpen) {
            popupsList.splice(index, 1);
            popup.visible = false;
        }
        popupManager.backDropVisibleChanged(popupsList.length > 0);
    }
}
