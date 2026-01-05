import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.theme
import qs.applications.Volume
import qs.applications.KeyboardLayout

PanelWindow {
    id: sidebarContainer
    screen: getScreen()
    anchors {
        top: true
        right: true
    }

    implicitWidth: columnLayout.width
    implicitHeight: columnLayout.height
    color: Theme.transparent

    ColumnLayout {
        id: columnLayout
        VolumeOSDv2 {}
        KeyboardLayoutOSD {}
    }

    function getScreen() {
        const findMonitor = screen => {
            return Hyprland.monitorFor(screen) === Hyprland.focusedMonitor;
        };

        const focusedScreen = Quickshell.screens.find(findMonitor);
        const fallbackMonitor = Quickshell.screens[0];

        return focusedScreen ?? fallbackMonitor;
    }
}
