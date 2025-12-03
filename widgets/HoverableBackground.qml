import QtQuick

Rectangle {
	id: backgroundRect

	property alias content: contentLoader.sourceComponent
	property color baseColor: "transparent"
	property color hoverColor: "#BD93F9"
	property int baseRadius: 0
	property int hoverRadius: 12
	property var forcedColor: null
	property var forcedRadius: null
	property var onClick: null
	property var onRightClick: null

	property int padding: 8

	property bool isHovered: false
	property bool hovered: isHovered

	color: backgroundRect.forcedColor !== null ? backgroundRect.forcedColor : (backgroundRect.isHovered ? hoverColor : baseColor)
	radius: backgroundRect.forcedRadius !== null ? backgroundRect.forcedRadius : (backgroundRect.isHovered ? hoverRadius : baseRadius)

	implicitHeight: contentLoader.implicitHeight + (2 * padding)
	implicitWidth: contentLoader.implicitWidth + (2 * padding) < 35 ? 35 : contentLoader.implicitWidth + (2 * padding)

	Loader {
		id: contentLoader
		anchors.centerIn: parent
		anchors.margins: padding
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		onEntered: backgroundRect.isHovered = true
		onExited: backgroundRect.isHovered = false
		onClicked: (mouse) => {
			if (backgroundRect.onClick && mouse.button === Qt.LeftButton) {
				backgroundRect.onClick()
			} else if (backgroundRect.onRightClick && mouse.button === Qt.RightButton) {
				backgroundRect.onRightClick()
			}
		}
	}

	Behavior on radius {
		NumberAnimation {
			duration: 110
			easing.type: Easing.InOutQuad
		}
	}
}