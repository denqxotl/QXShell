import Quickshell
import QtQuick
import QtQuick.Controls
import qs.theme

Slider {
    id: qxslider
    property int qxSliderWidth: 250
    property int qxSliderHeight: 20
    property int defaultValue: 0

    anchors {
        verticalCenter: parent.verticalCenter
    }

    implicitWidth: qxSliderWidth

    from: 0
    to: 100

    background: Rectangle {
        id: sliderBackground
        implicitWidth: qxslider.qxSliderWidth
        implicitHeight: qxslider.qxSliderHeight
        radius: Theme.radius
        color: Theme.currentLine
        Rectangle {
            radius: Theme.radius
            color: Theme.purple
            width: qxslider.visualPosition * parent.width
            height: parent.height
        }
    }
    handle: Rectangle {
        x: qxslider.leftPadding + qxslider.visualPosition * (qxslider.width - qxslider.leftPadding - qxslider.rightPadding) - width / 2
        y: parent.height / 2 - height / 2
    }

    Component.onCompleted: {
        qxslider.value = qxslider.defaultValue;
    }
}
