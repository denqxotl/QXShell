import Quickshell
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
    property var sink: Pipewire.defaultAudioSink
    property var source: Pipewire.defaultAudioSource

    content: Component {
        Column {
            id: volumeColumn
            anchors.fill: parent
            spacing: 21
            PwObjectTracker {
                objects: [sink, source]
            }
            Row {
                id: volumeRow
                spacing: 9
                anchors.verticalCenter: volumePopup.verticalCenter
                QXIcon {
                    icon: "audio"
                }
                Connections {
                    target: sink?.audio
                    function volumeChanged() {
                    // if()
                    // volumeSlider.volumeValue = Math.round((Pipewire.defaultAudioSink?.audio.volume || 1) * 100.0);
                    // volumeSlider.value = volumeSlider.volumeValue;
                    }
                }
                QXSlider {
                    id: volumeSlider
                    property var volumeValue: Math.round((Pipewire.defaultAudioSink?.audio.volume || 0) * 100.0)
                    value: volumeValue
                    onValueChanged:
                    // if (sink?.audio.volume || sink?.audio.volume === 0)
                    //     return;
                    // Pipewire.defaultAudioSink.audio.volume = value / 100.0;
                    {}
                }
            }
            Row {
                id: microphoneRow
                spacing: 8
                anchors.verticalCenter: volumePopup.verticalCenter
                Connections {
                    target: Pipewire.defaultAudioSource.audio
                    // function volumeChanged() {
                    //     microphoneSlider.microphoneValue = Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0);
                    //     microphoneSlider.value = microphoneSlider.microphoneValue;
                    // }
                }
                QXIcon {
                    icon: "microphone"
                }
                QXSlider {
                    id: microphoneSlider
                    property var microphoneValue: Math.round((Pipewire.defaultAudioSource?.audio.volume || 0) * 100.0)
                    value: microphoneValue
                    // onValueChanged: {
                    //     Pipewire.defaultAudioSource.audio.volume = value / 100.0;
                    // }
                }
            }
        }
    }
}
