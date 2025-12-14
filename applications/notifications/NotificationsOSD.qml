import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import qs.theme
import qs.components

Scope {
    id: notificationsOSD
    property bool shouldShowOsd: false
    property var notificationItems: []

    Connections {
        target: NotificationServer {
            onNotification: notification => {
                notificationItems.push(notification);
                notificationsOSD.shouldShowOsd = true;
                hideTimer.restart();
            }
        }
    }

    Timer {
        id: hideTimer
        interval: 3000
        onTriggered: notificationsOSD.shouldShowOsd = false
    }

    LazyLoader {
        active: notificationsOSD.shouldShowOsd

        PanelWindow {
            anchors {
                top: true
                right: true
            }
            exclusiveZone: 0

            implicitWidth: 400
            implicitHeight: 200
            color: "transparent"

            mask: Region {}

            Rectangle {
                opacity: 0.8
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.fill: parent
                radius: Theme.radius * 1.5
                color: Theme.background

                RowLayout {
                    anchors {
                        fill: parent
                        leftMargin: 12
                        rightMargin: 12
                    }
                    QXIcon {
                        size: 25
                        icon: "volume_muted"
                    }
                }
            }
        }
    }
}
