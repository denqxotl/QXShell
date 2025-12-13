import QtQuick
import qs

Image {
    id: qxicon
    property int size: 20
    property var icon: null

    source: getIcon()
    width: size
    height: size
    sourceSize: Qt.size(size, size)
    fillMode: Image.PreserveAspectFit

    function getIcon() {
        if (qxicon.icon != null && qxicon.icon != undefined) {
            return Static.getStaticFile(qxicon.icon + ".svg");
        }
        return Static.getStaticFile("arch.svg");
    }
}
