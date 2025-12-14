// VolumeBarItem.qml
import QtQuick
import qs
import qs.components
import qs.theme
import qs.applications.volume

Item {
    id: volumeRoot
    visible: VolumeService.isReady()
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    anchors {
        verticalCenter: parent.verticalCenter
    }

    QXButton {
        id: hoverBackground
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
