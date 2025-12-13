import QtQuick
import Quickshell.Services.Pipewire
import qs
import qs.components
import qs.theme

Item {
    id: volumeRoot
    visible: Pipewire.ready
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    property var sink: Pipewire.defaultAudioSink

    anchors {
        verticalCenter: parent.verticalCenter
    }

    PwObjectTracker {
        objects: [sink]
    }

    function togglePopup() {
        var point = volumeRoot.mapToItem(null, 0, 0);
        volumePopup.toggle('right', point.x + volumeRoot.width | 0, point.y);
    }

    function getVolumeIcon() {
        if (sink?.audio.muted || sink?.audio.volume === 0) {
            return "volume_muted";
        }
        return "volume_max";
    }

    function getVolumeText() {
        if (sink?.audio.muted || sink?.audio.volume === 0) {
            return null;
        }
        return Math.round(sink?.audio.volume * 100) + "%";
    }

    QXButton {
        id: hoverBackground
        onClick: () => {}
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                QXIcon {
                    icon: getVolumeIcon()
                }
                QXText {
                    text: getVolumeText()
                    font.pixelSize: 10
                }
            }
        }
    }
}
