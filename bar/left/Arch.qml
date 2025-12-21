import QtQuick
import qs
import qs.components
import qs.popups

Item {
    id: archLogo

    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    property int imageSize: 25
    property string archLogo: "arch_white"

    anchors {
        verticalCenter: parent.verticalCenter
    }

    function togglePowerMenu() {
        var point = archLogo.mapToItem(null, 0, 0);
        powerMenuPopup.toggle('left', point.x, point.y);
    }

    QXButton {
        id: hoverBackground
        onClick: togglePowerMenu
        content: Component {
            id: hoverContent
            QXIcon {
                icon: archLogo.archLogo
                size: archLogo.imageSize
            }
        }
    }
}
