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
  property string archLogoPath: Static.getStaticFile("arch.svg")
  property string archHoverLogoPath: Static.getStaticFile("arch_white.svg")

  anchors {
    verticalCenter: parent.verticalCenter
  }

  function getLogo() {
    if(hoverBackground.isHovered) {
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
      Image {
        source: archLogo.getLogo()
        width: archLogo.imageSize
        height: archLogo.imageSize
        fillMode: Image.PreserveAspectFit
      }
    }
  }
}