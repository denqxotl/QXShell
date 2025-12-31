import QtQuick
import QtQuick.Layouts
import qs.components
import qs.theme
import qs.applications.volume

Item {
    id: root
    visible: shouldShowOsd
    implicitWidth: osdContainer.width
    implicitHeight: osdContainer.height

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

    property bool shouldShowOsd: false

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.shouldShowOsd = false
    }

    function getFilledSliderWidth(parent) {
        if (VolumeService.isSinkMuted()) {
            return 0;
        }
        return parent.width * VolumeService.getSinkVolume();
    }

    Rectangle {
        id: osdContainer
        color: Theme.transparent
        implicitWidth: 400
        implicitHeight: 70
        Rectangle {
            anchors.rightMargin: 12
            anchors.topMargin: 12
            anchors.fill: parent
            radius: Theme.radius * 1.5
            color: Theme.withAlpha(Theme.background, 0.9)

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
}
