import QtQuick
import qs
import qs.components

Item {
    id: trayRoot
    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    property string trayIconSource: Static.getStaticFile("arrow_down.svg")

    anchors.verticalCenter: parent.verticalCenter

    function toggle() {
        const point = trayRoot.mapToItem(null, 0, 0);
        trayPopup.toggle('right', point.x + trayRoot.width | 0, point.y);
    }

    QXButton {
        id: hoverBackground
        anchors.centerIn: parent
        onClick: toggle
        content: Component {
            Row {
                anchors.centerIn: parent
                spacing: 4
                Image {
                    source: trayIconSource
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
