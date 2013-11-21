import QtQuick 2.1
import QtQuick.Window 2.1

Window {
    id: imageViewer
    minimumHeight: viewerImage.height
    minimumWidth: viewerImage.width
    function open(source) {
        viewerImage.source = source
        width = viewerImage.width + 20
        height = viewerImage.height + 20
        title = source
        visible = true
    }
    Image {
        id: viewerImage
        anchors.centerIn: parent
    }
}
