import Quickshell
import QtQuick
import Quickshell.Wayland
import qs.theme

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

    color: Theme.transparent
    Rectangle {
        anchors.fill: parent
        color: Theme.transparent
    }

    Connections {
        id: popupManagerConnections
        target: PopupManager

        function onBackDropVisibleChanged(visible) {
            background.visible = visible;
        }

        function onClosePopup() {
            PopupManager.closeAll();
        }
    }

    MouseArea {
        propagateComposedEvents: false
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            background.visible = false;
            PopupManager.closePopup();
        }
    }
}
