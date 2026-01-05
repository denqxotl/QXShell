import QtQuick
import Quickshell.Io
import qs.components
import qs.theme

QXPopup {
    id: layoutPopup
    implicitWidth: 400
    property var layouts: []

    Process {
        id: changeLayoutProcess
    }

    property var layoutsList: Process {
        id: listLayoutsProcess
        command: ['sh', '-c', "hyprctl getoption input:kb_layout | grep 'str: ' | awk -F'str: ' '{print $2}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                layoutPopup.layouts = this.text.split(',').map(function (item) {
                    return item.toUpperCase();
                });
            }
        }
    }

    content: Component {
        Column {
            anchors.centerIn: parent
            spacing: 12
            Repeater {
                model: layoutPopup.layouts
                delegate: QXButton {
                    implicitWidth: 350
                    onClick: () => {
                        changeLayoutProcess.exec(["sh", "-c", "hyprctl switchxkblayout keychron--keychron-link--keyboard " + index]);
                        PopupManager.close(layoutPopup);
                    }
                    content: Component {
                        QXText {
                            anchors.centerIn: parent
                            text: modelData
                            font.pixelSize: 16
                            font.bold: true
                        }
                    }
                }
            }
        }
    }
}
