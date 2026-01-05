import QtQuick
import Quickshell.Io
import qs
import qs.components
import qs.theme
import qs.popups

Item {
    id: networkRoot
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    anchors.verticalCenter: parent.verticalCenter
    property var networkSignalStrengthText: ""
    property bool networkConnected: false

    function getNetworkIcon(isNetworkConnected) {
        if (isNetworkConnected) {
            return Static.getStaticFile("network.svg");
        } else {
            return Static.getStaticFile("wifi-dis.svg");
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: networkProcess.running = true
    }

    Process {
        id: networkProcess
        command: ['sh', '-c', 'nmcli -t -f active,ssid,signal dev wifi | grep "^yes" | head -n 1 | cut -d: -f2,3']
        running: false
        stdout: SplitParser {
            onRead: data => {
                const rawData = data.toString().trim();
                if (rawData.length > 0) {
                    const parts = rawData.split(':');
                    const ssid = parts[0];
                    const strength = parseInt(parts[1]);
                    networkRoot.networkSignalStrengthText = strength + "%";
                    networkRoot.networkConnected = true;
                } else {
                    networkRoot.networkSignalStrengthText = "";
                    networkRoot.networkConnected = false;
                }
                networkProcess.running = false;
            }
        }
    }

    function togglePopup() {
        var point = networkRoot.mapToItem(null, 0, 0);
        networkPopup.toggle("left", point.x + networkRoot.width | 0, point.y);
    }

    QXButton {
        id: hoverBackground
        anchors.centerIn: parent
        onClick: togglePopup
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                Image {
                    source: getNetworkIcon(networkRoot.networkConnected)
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: networkPercentage
                    text: networkRoot.networkSignalStrengthText
                    font.pixelSize: 11
                    color: Theme.foreground
                }
            }
        }
    }
}
