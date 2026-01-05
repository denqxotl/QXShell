//@ pragma UseQApplication

import Quickshell
import QtQuick
import qs.bar
import qs.popups
import qs.wallpaper
import qs.applications.Volume
import qs.applications.KeyboardLayout
import qs.applications.SystemMonitor
import qs.applications.PowerMenu
import qs.Sidebar

ShellRoot {
    Variants {
        id: variants
        model: Quickshell.screens

        Item {
            property var modelData

            Wallpaper {
                screen: modelData
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
        }
    }
    SidebarContainer {}
}
