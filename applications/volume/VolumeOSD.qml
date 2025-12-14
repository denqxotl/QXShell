import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme
import qs.components
import qs.applications.volume

LazyLoader {
    active: VolumeService.isReady()
    Scope {
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

        LazyLoader {
            active: root.shouldShowOsd

            PanelWindow {
                anchors {
                    top: true
                    right: true
                }
                exclusiveZone: 0

                implicitWidth: 400
                implicitHeight: 70
                color: "transparent"

                mask: Region {}

                Rectangle {
                    opacity: 0.9
                    anchors.rightMargin: 12
                    anchors.topMargin: 12
                    anchors.fill: parent
                    radius: Theme.radius * 1.5
                    color: Theme.background

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
    }
}
