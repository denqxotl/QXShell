pragma Singleton
import Quickshell
import QtQuick

Singleton {
  function getStaticFile(fileName) {
    var shellPath = Qt.resolvedUrl(".").toString()
    return shellPath + "/static/" + fileName
  }
}
