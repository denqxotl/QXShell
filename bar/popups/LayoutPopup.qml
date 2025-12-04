import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import "../../components"

Popup {
  id: layoutPopup
  property var layouts: []

  Process {
    id: changeLayoutProcess
  }

  property var layoutsList: Process {
    id: listLayoutsProcess
    command: ['sh', '-c', "hyprctl getoption input:kb_layout | grep 'str: ' | awk -F'str: ' '{print $2}'"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        layoutPopup.layouts = this.text.split(',').map(function(item) { return item.toUpperCase(); });
      }
    }
  }

  content: Component {
    Column {
      anchors.centerIn: parent
      spacing: 12
      Repeater {
        model: layoutPopup.layouts
        delegate: HoverableBackground {
          onClick: () => {
            changeLayoutProcess.exec(["sh", "-c", "hyprctl switchxkblayout keychron--keychron-link--keyboard " + index]);
            layoutPopup.visible = false;
          }
          content: Component {
            Text {
              anchors.centerIn: parent
              text: modelData
              font.pixelSize: 16
              font.bold: true
              color: "white"
            }
          }
        }
      }
    }
  }
}