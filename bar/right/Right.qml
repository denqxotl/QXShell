import QtQuick
import Quickshell
import qs.theme

Item {
    id: rightContainerRoot
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter

    width: rightContainer.width
    height: rightContainer.height

    Rectangle {
        id: rightContainer
        width: rightRow.width
        height: rightRow.height
        color: Theme.transparent

        Row {
            id: rightRow
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            Tray {}
            SystemMonitor {}
            Volume {}
            Network {}
            KeyboardLayout {}
            Clock {}
        }
    }
}
