import QtQuick
import qs
import qs.components

Item {
    id: clockRoot
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    anchors.verticalCenter: parent.verticalCenter

    QXButton {
        id: hoverBackground
        anchors.centerIn: parent
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                Image {
                    source: Static.getStaticFile("system_monitor.svg")
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
