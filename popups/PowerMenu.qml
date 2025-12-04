import Quickshell
import QtQuick
import qs.popups.powermenu

Popup {
  content: Component {
    Row {
      id: powerMenuRow
      anchors.centerIn: parent
      spacing: 12
      Lock {
      }
      Sleep {
      }
      Reboot {
      }
      PowerOff {
      }
    }
  }
}