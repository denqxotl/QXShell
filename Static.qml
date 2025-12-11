pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property string rootPath: "."
    property string staticPath: "static"

    function getStaticFile(fileNameWithExtension) {
        var shellPath = Qt.resolvedUrl(rootPath).toString();
        return "%1/%2/%3".arg(shellPath).arg(staticPath).arg(fileNameWithExtension);
    }

    function getScriptPath(scriptNameWithExtension) {
        var shellPath = Qt.resolvedUrl(".").toString();
        var path = "%1/scripts/%2".arg(shellPath).arg(scriptNameWithExtension);

        return path.replace("file://", "");
    }

    function getPath(file) {
        var shellPath = Qt.resolvedUrl(".").toString();
        return "%1/%2".arg(shellPath).arg(file).replace("file://", "");
    }
}
