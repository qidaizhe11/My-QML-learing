
import QtQuick 2.0
//import QtQml.Models 2.0
import "PhotoViewerCore"

Rectangle {
    id: main_window

    property real download_progress: 0
    property bool image_loading: false
    property bool edit_mode: false

    width: 800; height: 480; color: "#d5d6d8"

    ListModel {
        id: photos_model
        ListElement { tag: "Flowers" }
        ListElement { tag: "WildLife" }
        ListElement { tag: "Prague" }
    }

    VisualDataModel {
        id: album_visual_model; model: photos_model
//        delegate: A
    }

    GridView {
        id: album_view; width: parent.width; height: parent.height
        cellWidth: 210; cellHeight: 220
    }
}
