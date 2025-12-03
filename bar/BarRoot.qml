import Quickshell
import QtQuick

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
