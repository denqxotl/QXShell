//@ pragma UseQApplication

import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.bar
import qs.popups
import qs.wallpaper
import qs.applications.volume
import qs.applications.KeyboardLayout
import qs.applications.notifications
import qs.applications.app_launcher
import qs.applications.SystemMonitor

ShellRoot {
    Variants {
        id: variants
        model: Quickshell.screens

        Item {
            property var modelData

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
                    spacing: 10
                    VolumeOSDv2 {}
                    KeyboardLayoutOSD {}
                }
            }
        }
    }
}
