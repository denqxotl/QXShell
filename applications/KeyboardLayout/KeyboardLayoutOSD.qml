import QtQuick
import QtQuick.Layouts
import qs.components
import qs.theme
import qs.applications.Volume

QXOsd {
    id: root
    property string currentLayout: "..."

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
            QXText {
                anchors.centerIn: parent
                text: root.currentLayout
                font {
                    bold: true
                    pixelSize: 18
                }
            }
        }
    }
}
