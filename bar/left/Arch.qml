import QtQuick
import qs
import qs.components
import qs.popups

Item {
  id: archLogo
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth
  property var vscreen
  property string archLogoPath: Static.getStaticFile("arch.svg")
  property string archHoverLogoPath: Static.getStaticFile("arch_white.svg")

  anchors.verticalCenter: parent.verticalCenter

  function getLogo() {
    if(hoverBackground.isHovered) {
      return archHoverLogoPath;
    } else {
      return archLogoPath;
    }
  }

  QXButton {
    id: hoverBackground
    anchors.centerIn: parent
    onClick: () =>{
      var point = archLogo.mapToItem(null, 0, 0);
      powerMenuPopup.toggle('left', point.x, point.y);
    }

    content: Component {
      id: hoverContent
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: archLogo.getLogo()
          width: 28
          height: 28
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}