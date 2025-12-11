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
                QXSlider {
                    id: volumeSlider
                    property var volumeValue: Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0)
                    value: volumeValue
                    onValueChanged: {
                        Pipewire.defaultAudioSink.audio.volume = value / 100.0;
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
                QXSlider {
                    id: microphoneSlider
                    property var microphoneValue: Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0)
                    value: microphoneValue
                    onValueChanged: {
                        Pipewire.defaultAudioSource.audio.volume = value / 100.0;
                    }
                }
            }
        }
    }
}
