//@ pragma UseQApplication

import Quickshell
import QtQuick
import qs.bar
import qs.popups
import qs.wallpaper
import qs.applications.volume

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

            WifiInfo {
                id: wifiInfoPopup
                anchor.window: bar
            }
        }
    }
    VolumeOSD {}
}
