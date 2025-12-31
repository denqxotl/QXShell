import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.components
import qs.theme
import qs.applications.volume

Item {
    id: root
    visible: shouldShowOsd
    implicitWidth: osdContainer.width
    implicitHeight: osdContainer.height

    property string currentLayout: "..."

    Connections {
        target: KeyboardLayoutService
        function onLayoutChanged(layout) {
            root.currentLayout = layout;
            root.shouldShowOsd = true;
            hideTimer.restart();
        }
    }

    property bool shouldShowOsd: false

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.shouldShowOsd = false
    }

    Rectangle {
        id: osdContainer
        color: Theme.transparent
        implicitWidth: 400
        implicitHeight: 70
        Rectangle {
            anchors.rightMargin: 12
            anchors.topMargin: 12
            anchors.fill: parent
            radius: Theme.radius * 1.5
            color: Theme.withAlpha(Theme.background, 0.9)

            RowLayout {
                anchors {
                    centerIn: parent
                    leftMargin: 12
                    rightMargin: 12
                }
                QXIcon {
                    size: 25
                    icon: "layout"
                }

                QXText {
                    text: root.currentLayout
                    font {
                        bold: true
                        pixelSize: 18
                    }
                }
            }
        }
    }
}
