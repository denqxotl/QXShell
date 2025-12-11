import QtQuick
import qs.theme

Rectangle {
    id: qxbutton

    property alias content: contentLoader.sourceComponent
    property int baseRadius: 2
    property int hoverRadius: 12
    property int minWidth: 35
    property var forcedColor: null
    property var forcedRadius: null
    property var onClick: null
    property var onRightClick: null
    property int padding: 8
    property bool isHovered: false
    property bool hovered: isHovered

    function getContentHeight() {
        return contentLoader.implicitHeight + (2 * padding);
    }

    function getContentWidth() {
        if (contentLoader.implicitWidth + (2 * padding) < minWidth) {
            return minWidth;
        } else {
            return contentLoader.implicitWidth + (2 * padding);
        }
    }

    function getColor() {
        if (forcedColor !== null) {
            return forcedColor;
        } else if (isHovered) {
            return Theme.purple;
        } else {
            return Theme.transparent;
        }
    }

    function getRadius() {
        if (forcedRadius !== null) {
            return forcedRadius;
        } else if (isHovered) {
            return hoverRadius;
        } else {
            return baseRadius;
        }
    }

    function handleOnClick(mouse) {
        console.log('Clocked');
        switch (mouse.button) {
        case Qt.LeftButton:
            {
                qxbutton.onClick();
                break;
            }
        case Qt.RightButton:
            {
                qxbutton.onRightClick();
                break;
            }
        default:
            break;
        }
    }

    color: qxbutton.getColor()
    radius: qxbutton.getRadius()

    implicitHeight: qxbutton.getContentHeight()
    implicitWidth: qxbutton.getContentWidth()

    Loader {
        id: contentLoader
        anchors.centerIn: parent
        anchors.margins: padding
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onEntered: qxbutton.isHovered = true
        onExited: qxbutton.isHovered = false
        onClicked: mouse => handleOnClick(mouse)
    }

    Behavior on radius {
        NumberAnimation {
            duration: 110
            easing.type: Easing.InOutQuad
        }
    }
}
