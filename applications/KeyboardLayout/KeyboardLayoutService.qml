pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: keyboardLayoutService
    signal layoutChanged(string layout)

    Process {
        id: layoutProcess
        command: ['sh', '-c', 'hyprlayout']
        running: true
        stdout: SplitParser {
            id: layoutParser
            onRead: data => {
                keyboardLayoutService.layoutChanged(data.toString().trim());
            }
        }
    }
}
