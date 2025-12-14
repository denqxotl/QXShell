// VolumeBarItem.qml
import QtQuick
import Quickshell.Services.Pipewire
import qs
import qs.components
import qs.theme
import qs.applications.volume.services

Item {
    id: volumeRoot
    visible: Pipewire.ready
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth
    anchors {
        verticalCenter: parent.verticalCenter
    }
    QXButton {
        id: hoverBackground
        onClick: () => {}
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                QXIcon {
                    icon: VolumeService.getVolumeIcon()
                }
                QXText {
                    text: VolumeService.getVolumePercentage()
                    font.pixelSize: 10
                }
            }
        }
    }
}
