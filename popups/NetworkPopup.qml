import Quickshell
import Quickshell.Io
import QtQuick
import qs
import qs.theme
import qs.components

Popup {
    id: networkManagerPopup
    property var networks: []
    property var connectedNetwork: null

    Process {
        id: fetchNetworksProcess
        command: ["sh", "-c", Static.getScriptPath("available_networks.sh")]
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
            id: contentColumn
            QXText {
                width: 250
                text: "Connected Network"
                visible: networkManagerPopup.connectedNetwork !== null
                font.pixelSize: 16
                font.bold: true
                padding: 8
            }
            QXButton {
                id: connectedNetworkButton
                visible: networkManagerPopup.connectedNetwork !== null
                content: Component {
                    Row {
                        spacing: 8
                        QXIcon {
                            icon: "network"
                        }
                        QXText {
                            width: 250
                            text: networkManagerPopup.connectedNetwork?.ssid || ""
                        }
                        QXText {
                            text: networkManagerPopup.connectedNetwork?.signal + "%"
                            font.pixelSize: 10
                        }
                    }
                }
            }
            QXText {
                width: 250
                text: "Available Networks"
                font.pixelSize: 16
                font.bold: true
                padding: 8
            }
            Repeater {
                model: networkManagerPopup.networks
                QXButton {
                    visible: modelData.ssid !== ""
                    onClick: () => {
                    // var point = contentColumn.mapToItem(null, 0, 0);
                    // wifiInfoPopup.toggle("right", point.x | 0, point.y);
                    }
                    content: Component {
                        Row {
                            spacing: 8
                            QXIcon {
                                anchors.verticalCenter: parent.verticalCenter
                                icon: "network"
                            }
                            QXText {
                                width: 250
                                text: modelData.ssid
                            }
                            QXText {
                                text: modelData.signal + "%"
                                font.pixelSize: 10
                            }
                        }
                    }
                }
            }
        }
    }
}
