import QtQuick
import qs.components
import qs.theme

Item {
    id: root
    property alias content: content.sourceComponent
    property alias hideTimer: hideTimer
    visible: shouldShowOsd
    implicitWidth: osdContainer.width
    implicitHeight: osdContainer.height

    property bool shouldShowOsd: false

    Timer {
        id: hideTimer
        interval: 1200
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
            Loader {
                id: content
                anchors.fill: parent
            }
        }
    }
}
