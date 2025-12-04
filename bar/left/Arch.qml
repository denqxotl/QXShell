import QtQuick
import qs.components
import qs.popups

Item {
  id: archLogo
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth
  property var vscreen
  property string archLogoPath: "../../static/arch.svg"
  property string archHoverLogoPath: "../../static/arch_white.svg"

  anchors.verticalCenter: parent.verticalCenter

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
          source: hoverBackground.isHovered ? archHoverLogoPath : archLogoPath
          width: 28
          height: 28
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}