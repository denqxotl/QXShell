import QtQuick
import QtQuick.Layouts
import qs.theme
import qs.applications.Volume
import qs.components

QXOsd {
    id: root
    Connections {
        target: VolumeService.sink?.audio

        function onVolumeChanged() {
            root.shouldShowOsd = true;
            hideTimer.restart();
        }

        function onMutedChanged() {
            root.shouldShowOsd = true;
            hideTimer.restart();
        }
    }

    function getFilledSliderWidth(parent) {
        if (VolumeService.isSinkMuted()) {
            return 0;
        }
        return parent.width * VolumeService.getSinkVolume();
    }

    content: Component {
        RowLayout {
            anchors {
                fill: parent
                leftMargin: 12
                rightMargin: 12
            }
            QXIcon {
                size: 25
                icon: VolumeService.getVolumeIcon()
            }

            Rectangle {
                Layout.fillWidth: true
                color: Theme.selection

                implicitHeight: 10
                radius: 20

                Rectangle {
                    id: filledSlider
                    color: Theme.purple
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }

                    implicitWidth: getFilledSliderWidth(parent)
                    radius: parent.radius
                }
            }
        }
    }
}
