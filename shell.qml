//@ pragma UseQApplication
import Quickshell
import QtQuick
import qs.bar
import qs.popups

ShellRoot {
  Variants {
    id: variants
    model: Quickshell.screens

    Item {
      property var modelData
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

      VolumePopup {
        id: volumePopup
        anchor.window: bar
      }
    }
  }
}
