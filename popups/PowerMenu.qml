import Quickshell
import Quickshell.Io
import QtQuick
import qs
import qs.components

Popup {
    id: powerMenuPopup
    property int iconSize: 30

    property var powerMenuActions: [
        {
            type: "lock",
            icon: "lock.svg",
            action: "hyprctl dispatch exec hyprlock"
        },
        {
            type: "sleep",
            icon: "sleep.svg",
            action: "systemctl suspend"
        },
        {
            type: "reboot",
            icon: "restart.svg",
            action: "systemctl reboot"
        },
        {
            type: "poweroff",
            icon: "poweroff.svg",
            action: "systemctl poweroff"
        }
    ]

    Process {
        id: actionProcess
    }

    content: Component {
        Row {
            id: powerMenuRow
            anchors.centerIn: parent
            spacing: 12
            Repeater {
                model: powerMenuActions
                delegate: QXButton {
                    onClick: () => executeAction(modelData.action)
                    content: Component {
                        Image {
                            source: Static.getStaticFile(modelData.icon)
                            width: powerMenuPopup.iconSize
                            height: powerMenuPopup.iconSize
                            fillMode: Image.PreserveAspectFit
                            sourceSize: Qt.size(powerMenuPopup.iconSize, powerMenuPopup.iconSize)
                        }
                    }
                }
            }
        }
    }

    function executeAction(command) {
        PopupManager.closeAll();
        actionProcess.exec(["sh", "-c", command]);
    }
}
