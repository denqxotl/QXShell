// VolumeService.qml
pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: volumeService
    property string volumeMaxIcon: "volume_max"
    property string volumeMutedIcon: "volume_muted"
    property var sink: Pipewire.defaultAudioSink
    property var source: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [sink, source]
    }

    function isReady() {
        return Pipewire.ready && !!sink?.audio;
    }

    function getVolumeIcon() {
        const volume = sink?.audio.volume;
        const muted = sink?.audio.muted;
        if (muted || volume === 0) {
            return volumeService.volumeMutedIcon;
        }
        return volumeService.volumeMaxIcon;
    }

    function getVolumePercentage() {
        const volume = sink?.audio.volume;
        const muted = sink?.audio.muted;
        const formattedVolume = Math.round(volume * 100);
        if (muted || formattedVolume === 0) {
            return null;
        }
        return formattedVolume + "%";
    }

    function isSinkMuted() {
        return sink?.audio.muted;
    }

    function getSinkVolume() {
        return sink?.audio.volume || 0;
    }
}
