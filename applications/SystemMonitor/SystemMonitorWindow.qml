import Quickshell

Scope {
    id: systemMonitorWindow

    LazyLoader {
        active: true
        PanelWindow {
            anchors {
                top: true
                right: true
            }
            focusable: true
            exclusiveZone: 0
            implicitWidth: 600
            implicitHeight: 200

            mask: Region {}
        }
    }
}
