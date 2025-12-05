pragma Singleton

import Quickshell
import QtQuick

Singleton {
  property string rootPath: "."
  property string staticPath: "static"

  function getStaticFile(fileNameWithExtension) {
    var shellPath = Qt.resolvedUrl(rootPath).toString()
    return "%1/%2/%3"
      .arg(shellPath)
      .arg(staticPath)
      .arg(fileNameWithExtension)
  }
}
