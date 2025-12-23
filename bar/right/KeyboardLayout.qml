import Quickshell.Io
import QtQuick
import qs
import qs.components
import qs.theme

Item {
    id: keyboardLayout
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    anchors.verticalCenter: parent.verticalCenter
    property string currentLayout: "..."

    Process {
        id: layoutProcess
        command: ['sh', '-c', 'hyprlayout']
        running: true
        stdout: SplitParser {
            id: layoutParser
            onRead: data => {
                keyboardLayout.currentLayout = data.toString().trim();
            }
        }
    }

    QXButton {
        id: hoverBackground
        onClick: () => {
            var point = keyboardLayout.mapToItem(null, 0, 0);
            layoutPopup.toggle("center", point.x, point.y);
        }
        anchors.centerIn: parent
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                Image {
                    source: Static.getStaticFile("layout.svg")
                    width: 19
                    height: 19
                    fillMode: Image.PreserveAspectFit
                }

                QXText {
                    id: layoutText
                    text: keyboardLayout.currentLayout
                    font.bold: true
                }
            }
        }
    }
}
