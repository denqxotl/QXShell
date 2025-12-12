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
            icon: "lock",
            action: "hyprctl dispatch exec hyprlock"
        },
        {
            type: "sleep",
            icon: "sleep",
            action: "systemctl suspend"
        },
        {
            type: "reboot",
            icon: "restart",
            action: "systemctl reboot"
        },
        {
            type: "poweroff",
            icon: "poweroff",
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
                        QXIcon {
                            icon: modelData.icon
                            size: powerMenuPopup.iconSize
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
