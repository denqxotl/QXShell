import QtQuick
import QtQuick.Layouts
import qs.components
import qs.theme
import qs.applications.Volume

QXOsd {
    id: root
    property string currentLayout: ".."

    Connections {
        target: KeyboardLayoutService
        function onLayoutChanged(layout) {
            root.currentLayout = layout;
            root.shouldShowOsd = true;
            hideTimer.restart();
        }
    }

    content: Component {
        RowLayout {
            spacing: 8
            Item {
                Layout.fillWidth: true
            }
            QXIcon {
                icon: "layout"
            }
            QXText {
                text: root.currentLayout
                font {
                    bold: true
                    pixelSize: 18
                }
            }
            Item {
                Layout.fillWidth: true
            }
        }
    }
}
