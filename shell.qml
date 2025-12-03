//@ pragma UseQApplication
import Quickshell
import QtQuick
import "bar"
import "bar/popups"

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
        id: barInstance
        vscreen: modelData
      }
    }
  }
}
