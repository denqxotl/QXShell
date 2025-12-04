import QtQuick
import qs
import qs.components

Item {
  id: trayRoot
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter

  QXButton {
    id: hoverBackground
    anchors.centerIn: parent
    onClick: () =>{
      var point = trayRoot.mapToItem(null, 0, 0);
      trayPopup.toggle('right', point.x + trayRoot.width | 0, point.y);
    }
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: Static.getStaticFile("arrow_down.svg")
          width: 20
          height: 20
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}