import Quickshell.Io
import QtQuick
import "../../widgets"

Item {
  id: keyboardLayout
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  anchors.verticalCenter: parent.verticalCenter
  property string currentLayout: "..."

  Process {
    id: layoutProcess
    command: ['sh', '-c', '/home/denqxotl/.config/quickshell/bar/right/keyboardlayout/layoutlistener.sh']
    running: true
    stdout: SplitParser {
      id: layoutParser
      onRead: (data) => {
        keyboardLayout.currentLayout = parseLayout(data.toString().trim())
      }
    }
  }

  function parseLayout(layout) {
    switch(layout) {
      case "English (US)":
        return "EN";
      case "Ukrainian":
        return "UA";
      default:
        return "...";
    }
  }

  Process {
    id: initialLayoutProcess
    command: ['hyprctl', 'devices', '-j']
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const raw = this.text.toString().trim();
        try {
          const devices = JSON.parse(raw);
          const keyboard = devices.keyboards.find(k => k.active_keymap);
          if (keyboard) {
            keyboardLayout.currentLayout = parseLayout(keyboard.active_keymap);
          }
        } catch (e) {
            console.error("JSON Parsing failed:", e);
            keyboardLayout.currentLayout = "...";
        }
        initialLayoutProcess.running = false;
      }
    }
  }

  HoverableBackground {
    id: hoverBackground
    onClick: () => {
      var point = keyboardLayout.mapToItem(null, 0, 0);
      layoutPopup.toggle("center", point.x, point.y);
    }
    anchors.centerIn: parent
    content: Component {
      Row {
        anchors.centerIn: parent
        spacing: 4
        Image {
          source: "../../static/layout.svg"
          width: 19
          height: 19
          fillMode: Image.PreserveAspectFit
        }

        Text {
          anchors.verticalCenter: parent.verticalCenter
          id: layoutText
          text: keyboardLayout.currentLayout
          font.pixelSize: 14
          font.bold: true
          color: "white"
        }
      }
    }
  }
}