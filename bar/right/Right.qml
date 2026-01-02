import QtQuick
import qs.theme
import qs.applications.Volume
import qs.applications.SystemMonitor
import qs.applications.KeyboardLayout

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
            KeyboardLayoutBarItem {}
            Clock {}
        }
    }
}
