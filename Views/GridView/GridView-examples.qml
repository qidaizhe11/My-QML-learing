import QtQuick 2.0

Rectangle {
    width: 480; height: 800
    color: "white"

    ListModel {
        id: appModel
        ListElement { name: "Music"; icon: "pics/AudioPlayer_48.png" }
        ListElement { name: "Movies"; icon: "pics/VideoPlayer_48.png" }
        ListElement { name: "Camera"; icon: "pics/Camera_48.png" }
        ListElement { name: "Calendar"; icon: "pics/DateBook_48.png" }
    }

    GridView {
        anchors.fill: parent
        cellWidth: 100; cellHeight: 100
        focus: true
        model: appModel

        highlight: Rectangle { width: 80; height: 80; color: "lightsteelblue" }

        delegate: Item {
            width: 100; height: 100

            Image {
                id: myIcon
                source: icon
                y: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                anchors { top: myIcon.bottom;
                    horizontalCenter: parent.horizontalCenter }
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked: parent.GridView.view.currentIndex = index
            }
        }
    }
}
