import QtQuick 2.1
import QtQuick.Controls 1.0

Item {
    id: root
    width: 600
    height: 300
    anchors.fill: parent
    anchors.margins: Qt.platform.os === "osx" ? 12 : 6

    ListModel {
        id: dummyModel
        Component.onCompleted: {
            for (var i = 0; i < 100; ++i) {
                append({"title": "A title " + i, "imagesource" : "http://someurl.com",
                       "credit": "N/A"})
            }
        }
    }

    TableView {
        model: dummyModel
        anchors.fill: parent

        TableViewColumn {
            role: "title"
            title: "Title"
            width: 120
        }
        TableViewColumn {
            role: "credit"
            title: "Credit"
            width: 120
        }
        TableViewColumn {
            role: "imagesource"
            title: "Image source"
            width: 200
            visible: true
        }
    }
}
