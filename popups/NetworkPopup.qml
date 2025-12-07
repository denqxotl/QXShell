import Quickshell
import Quickshell.Io
import QtQuick
import qs.popups.powermenu


Popup {
  id: networkManagerPopup
  property var networks: []

  Process {
    id: fetchNetworksProcess
    command: ["sh", "-c", "/home/denqxotl/.config/quickshell/scripts/available_networks.sh"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const raw = JSON.parse(this.text.toString());
      }
    }
  }

  content: Component {
    Text {
      text: "Network Manager Popup"
    }
  }
}