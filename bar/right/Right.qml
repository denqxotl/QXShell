import QtQuick
import qs.theme
import qs.applications.volume
import qs.applications.SystemMonitor

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
            SystemMonitorBarItem {}
            VolumeBarItem {}
            Network {}
            KeyboardLayout {}
            Clock {}
        }
    }
}
