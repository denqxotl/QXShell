import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls
import qs
import qs.components
import qs.popups
import qs.theme

// TODO: refactor this popup. it has too much shit
Popup {
    id: volumePopup
    content: Component {
        Column {
            id: volumeColumn
            anchors.fill: parent
            spacing: 20
            PwObjectTracker {
                objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
            }
            Row {
                id: volumeRow
                spacing: 8
                anchors.verticalCenter: volumePopup.verticalCenter
                Image {
                    source: Static.getStaticFile("audio.svg")
                    width: 22
                    height: 22
                    sourceSize: Qt.size(22, 22)
                    fillMode: Image.PreserveAspectFit
                }
                Connections {
                    target: Pipewire.defaultAudioSink?.audio
                    function onVolumeChanged() {
                        volumeSlider.volumeValue = Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0);
                        volumeSlider.value = volumeSlider.volumeValue;
                    }
                }
                Slider {
                    id: volumeSlider
                    anchors.verticalCenter: volumeRow.verticalCenter
                    property var volumeValue: Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0)
                    width: 250
                    from: 0
                    to: 100
                    value: volumeValue
                    onValueChanged: {
                        Pipewire.defaultAudioSink.audio.volume = value / 100.0;
                    }
                    background: Rectangle {
                        id: sliderBackground
                        implicitWidth: 250
                        implicitHeight: 20
                        radius: 12
                        color: Theme.currentLine
                        Rectangle {
                            radius: 12
                            width: volumeSlider.visualPosition * parent.width
                            height: parent.height
                            color: Theme.purple
                        }
                    }
                    handle: Rectangle {
                        x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.width - volumeSlider.leftPadding - volumeSlider.rightPadding) - width / 2
                        y: parent.height / 2 - height / 2
                    }
                }
            }
            Row {
                id: microphoneRow
                spacing: 8
                anchors.verticalCenter: volumePopup.verticalCenter
                Connections {
                    target: Pipewire.defaultAudioSource?.audio
                    function onVolumeChanged() {
                        microphoneSlider.microphoneValue = Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0);
                        microphoneSlider.value = microphoneSlider.microphoneValue;
                    }
                }
                Image {
                    source: Static.getStaticFile("microphone.svg")
                    width: 20
                    height: 20
                    sourceSize: Qt.size(20, 20)
                    fillMode: Image.PreserveAspectFit
                }
                Slider {
                    id: microphoneSlider
                    property var microphoneValue: Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0)
                    anchors.verticalCenter: microphoneRow.verticalCenter
                    width: 250
                    from: 0
                    to: 100
                    value: microphoneValue
                    onValueChanged: {
                        Pipewire.defaultAudioSource.audio.volume = value / 100.0;
                    }
                    background: Rectangle {
                        id: sliderBackgroundMic
                        implicitWidth: 250
                        implicitHeight: 20
                        radius: 12
                        color: Theme.currentLine
                        Rectangle {
                            radius: 12
                            width: microphoneSlider.visualPosition * parent.width
                            height: parent.height
                            color: Theme.purple
                        }
                    }
                    handle: Rectangle {
                        x: microphoneSlider.leftPadding + microphoneSlider.visualPosition * (microphoneSlider.width - microphoneSlider.leftPadding - microphoneSlider.rightPadding) - width / 2
                        y: parent.height / 2 - height / 2
                    }
                }
            }
        }
    }
}
