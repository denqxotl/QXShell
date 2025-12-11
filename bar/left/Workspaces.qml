import Quickshell.Hyprland
import QtQuick
import qs.components
import qs.theme

Item {
    id: clockRoot
    implicitHeight: workspacesRow.implicitHeight
    implicitWidth: workspacesRow.implicitWidth
    property var vscreen
    anchors.verticalCenter: parent.verticalCenter

    Row {
        id: workspacesRow
        spacing: 4
        Repeater {
            model: Hyprland.workspaces
            delegate: QXButton {
                forcedColor: getColorForActiveWorkspace(modelData)
                forcedRadius: getRadiusForActiveWorkspace(modelData.active)
                visible: shouldWorkspaceBeVisible(modelData)
                onClick: () => {
                    changeWorkspace(modelData.id, modelData.active);
                }
                content: Component {
                    QXText {
                        text: modelData.id
                        font {
                            bold: modelData.active
                        }
                    }
                }
            }
        }
    }

    function getColorForActiveWorkspace(workspace) {
        if (workspace.active && Hyprland.focusedMonitor != null && workspace.monitor.name === Hyprland.focusedMonitor.name) {
            return Theme.currentLine;
        }
        return null;
    }

    function shouldWorkspaceBeVisible(workspace) {
        return !workspace.monitor || (bar.vscreen && workspace.monitor.name === bar.vscreen.name);
    }

    function getRadiusForActiveWorkspace(isActive) {
        return isActive ? Theme.radius : null;
    }

    function changeWorkspace(id, isActive) {
        if (isActive)
            return;
        Hyprland.dispatch("workspace " + id);
    }
}
