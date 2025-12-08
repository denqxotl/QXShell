import Quickshell
import Quickshell.Io
import QtQuick
import qs.theme
import qs.popups.powermenu
import qs.components

Popup {
  id: networkManagerPopup
  property var networks: []
  property var connectedNetwork: null

  Process {
    id: fetchNetworksProcess
    command: ["sh", "-c", "/home/denqxotl/.config/quickshell/popups/scripts/available_networks.sh"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        var allNetworks = JSON.parse(this.text);
        networkManagerPopup.connectedNetwork = allNetworks.find(n => n.in_use) || null;
        networkManagerPopup.networks = allNetworks.filter(n => !n.in_use);
      }
    }
  }

  content: Component {
    Column {
      Text {
        width: 250
        text: "Connected Network"
        visible: networkManagerPopup.connectedNetwork !== null
        color: Theme.foreground
        font.pixelSize: 16
        font.bold: true
        padding: 8
      }
      QXButton {
        id: connectedNetworkButton
        visible: networkManagerPopup.connectedNetwork !== null
        content: Component {
          Text {
            width: 250
            text: networkManagerPopup.connectedNetwork?.ssid || ""
            color: Theme.foreground
            font.pixelSize: 14
          }
        }
      }
      Text {
        width: 250
        text: "Available Networks"
        color: Theme.foreground
        font.pixelSize: 16
        font.bold: true
        padding: 8
      }
      Repeater {
        model: networkManagerPopup.networks
        QXButton {
          visible: modelData.ssid !== ""
          content: Component {
            Text {
              width: 250
              text: modelData.ssid
              color: Theme.foreground
              font.pixelSize: 14
            }
          }
        }
      }
    }
  }
}