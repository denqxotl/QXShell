import Quickshell
import QtQuick
import QtQuick.Controls
import qs.theme

Slider {
    id: qxslider
    anchors.verticalCenter: parent.verticalCenter
    width: 250
    from: 0
    to: 100
    background: Rectangle {
        id: sliderBackground
        implicitWidth: 250
        implicitHeight: 20
        radius: 12
        color: Theme.currentLine
        Rectangle {
            radius: 12
            width: qxslider.visualPosition * parent.width
            height: parent.height
            color: Theme.purple
        }
    }
    handle: Rectangle {
        x: qxslider.leftPadding + qxslider.visualPosition * (qxslider.width - qxslider.leftPadding - qxslider.rightPadding) - width / 2
        y: parent.height / 2 - height / 2
    }
}
