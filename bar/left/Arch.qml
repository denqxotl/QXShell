import QtQuick
import qs
import qs.components
import qs.popups

Item {
    id: archLogo

    implicitHeight: hoverBackground.implicitHeight
    implicitWidth: hoverBackground.implicitWidth

    property var vscreen
    property int imageSize: 28
    property string archLogo: "arch_white"

    anchors {
        verticalCenter: parent.verticalCenter
    }

    function getLogo() {
        if (hoverBackground.isHovered) {
            return archHoverLogoPath;
        } else {
            return archLogoPath;
        }
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
