import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import "../../components"

Popup {
  id: trayPopup
  content: Component {
    Row {
      anchors.centerIn: parent
      spacing: 0
      Repeater {
        model: SystemTray.items
        delegate: HoverableBackground {
          content: Component {
            Image {
              source: modelData.icon
              width: 20
              height: 20
              fillMode: Image.PreserveAspectFit
              sourceSize: Qt.size(24, 24)
            }
          }
          onClick: () => {
            modelData.activate();
            trayPopup.visible = false;
          }
          onRightClick: () => {
            menuAnchorComponent.createObject(menuAnchorComponent).open();
          }
          Component {
            id: menuAnchorComponent
            QsMenuAnchor {
              anchor.window: trayPopup
              menu: modelData.menu
            }
          }
        }
      }
    }
  }
}