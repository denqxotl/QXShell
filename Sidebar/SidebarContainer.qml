import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.applications.Volume
import qs.applications.KeyboardLayout

PanelWindow {
    exclusiveZone: 0
    visible: Hyprland.focusedMonitor.name === modelData.name
    screen: modelData
    anchors {
        top: true
        right: true
    }
    implicitWidth: columnLayout.width
    implicitHeight: columnLayout.height
    color: "transparent"
    ColumnLayout {
        id: columnLayout
        VolumeOSDv2 {}
        KeyboardLayoutOSD {}
    }
}
