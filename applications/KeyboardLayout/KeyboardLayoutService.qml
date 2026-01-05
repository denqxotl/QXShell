pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: keyboardLayoutService
    signal layoutChanged(string layout)

    readonly property var layoutCommandBin: ['sh', '-c', 'hyprlayout']

    Process {
        id: layoutProcess
        command: KeyboardLayoutService.layoutCommandBin
        running: true
        stdout: SplitParser {
            id: layoutParser
            onRead: data => {
                keyboardLayoutService.layoutChanged(data.toString().trim());
            }
        }
    }
}
