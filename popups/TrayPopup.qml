import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import qs.components

QXPopup {
    id: trayPopup
    content: Component {
        Row {
            anchors.centerIn: parent
            spacing: 0
            Repeater {
                model: SystemTray.items
                delegate: QXButton {
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
                        PopupManager.close(trayPopup);
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
