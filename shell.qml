//@ pragma UseQApplication

import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.bar
import qs.popups
import qs.wallpaper
import qs.applications.Volume
import qs.applications.KeyboardLayout
import qs.applications.notifications
import qs.applications.AppLauncher
import qs.applications.SystemMonitor
import qs.applications.PowerMenu

ShellRoot {
    Variants {
        id: variants
        model: Quickshell.screens

        Item {
            property var modelData

            // Launcher {}

            Wallpaper {
                vscreen: modelData
            }

            Backdrop {
                vscreen: modelData
            }

            Bar {
                id: bar
                vscreen: modelData
            }

            PowerMenu {
                id: powerMenuPopup
                anchor.window: bar
            }

            TrayPopup {
                id: trayPopup
                anchor.window: bar
            }

            LayoutPopup {
                id: layoutPopup
                anchor.window: bar
            }

            NetworkPopup {
                id: networkPopup
                anchor.window: bar
            }

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
        }
    }
}
