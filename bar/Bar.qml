import Quickshell
import QtQuick
import qs.bar.left
import qs.bar.right
import qs.popups
import qs.theme

PanelWindow {
    id: barItem
    property var vscreen
    implicitHeight: 50
    color: Theme.transparent
    screen: vscreen
    anchors {
        left: true
        right: true
        top: true
    }

    Rectangle {
        anchors.fill: parent
        implicitHeight: 50
        bottomLeftRadius: 12
        bottomRightRadius: 12
        color: Theme.withAlpha(Theme.background, 0.8)

        anchors {
            leftMargin: 0
            rightMargin: 0
            bottomMargin: 0
        }
        Left {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 12
            }
        }
        Right {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 12
            }
        }
    }
}
