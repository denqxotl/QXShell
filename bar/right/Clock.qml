import QtQuick
import Quickshell.Io
import qs.components
import qs.theme

Item {
  id: clockRoot
  implicitHeight: hoverBackground.implicitHeight
  implicitWidth: hoverBackground.implicitWidth

  property var timeFormat: "HH:mm"
  property var dateFormat: "dd"
  property var monthFormat: "MMM"

  property string currentTime: Qt.formatTime(new Date(), timeFormat)
  property string currentDate: Qt.formatDate(new Date(), dateFormat)
  property string currentMonth: Qt.formatDate(new Date(), monthFormat)

  Timer {
    interval: 100
    running: true
    repeat: true
    onTriggered: {
      const now = new Date()
      clockRoot.currentTime = Qt.formatTime(now, timeFormat)
      clockRoot.currentDate = Qt.formatDate(now, dateFormat)
      clockRoot.currentMonth = Qt.formatDate(now, monthFormat)
    }
  }

  property var notificationCenter: Process {
    command: ["sh", "-c", "swaync-client -t"]
  }


  QXButton {
    id: hoverBackground
    onClick: () => {
      notificationCenter.startDetached()
    }
    anchors.fill: parent
    content: Component {
      Row {
        id: clockRow
        spacing: 12
        Text {
          id: timeBlock
          anchors.verticalCenter: parent.verticalCenter
          text: currentTime
          font.pixelSize: 15
          font.bold: true
          color: Theme.foreground
        }
        Column {
          spacing: 0
          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: currentDate
            font.pixelSize: 10
            color: Theme.foreground
          }
          Text {
            text: currentMonth
            font.pixelSize: 10
            color: Theme.foreground
          }
        }
      }
    }
  }
}