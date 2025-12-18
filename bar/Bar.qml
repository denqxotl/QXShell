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
        color: Theme.background
        opacity: 0.9
        anchors {
            leftMargin: 8
            rightMargin: 8
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
