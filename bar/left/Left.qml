import QtQuick
import qs.theme
import qs.applications.Hyprland

Item {
    id: leftContainerRoot

    property var vscreen

    implicitWidth: leftContainer.width
    implicitHeight: leftContainer.height

    anchors {
        right: parent.left
        verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: leftContainer
        width: leftRow.width
        height: leftRow.height
        color: Theme.transparent

        Row {
            id: leftRow
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            Arch {}
            WorkspacesBarItems {
                vscreen: vscreen
            }
        }
    }
}
