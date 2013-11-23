import QtQuick 2.0
import "core"

Rectangle {
    id: screen
    width: 1000; height: 1000
    property int partition: height / 4
    state: "DRAWER_CLOSED"

    MenuBar {
        id: menuBar
        height: screen.partition
        width: screen.width
        z: 1
    }

    TextArea {
        id: textArea
        color: "#3f3f3f"
        fontColor: "#dcdccc"
        height: partition * 3
        width: parent.width
        y: partition
    }

    Rectangle {
        id: drawer
        height: 15; width: parent.width
        border.color: "#6a6d6a"
        border.width: 1
        z: 1

        Image {
            id: arrowIcon
            source: "images/arrow.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: drawerMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = Qt.lighter("#6a6d6a")
            onExited: parent.border.color = "#6a6d6a"
            onClicked: {
                if (screen.state == "DRAWER_CLOSED")
                    screen.state = "DRAWER_OPEN"
                else if (screen.state == "DRAWER_OPEN")
                    screen.state = "DRAWER_CLOSED"
            }
        }
    }

    states: [
        State {
            name: "DRAWER_OPEN"
            PropertyChanges { target: menuBar; y: 0 }
            PropertyChanges { target: drawer; y: partition }
            PropertyChanges { target: textArea; y: partition + drawer.height }
            PropertyChanges { target: arrowIcon; rotation: 180 }
        },
        State {
            name: "DRAWER_CLOSED"
            PropertyChanges { target: menuBar; y: -height }
            PropertyChanges { target: drawer; y: 0 }
            PropertyChanges { target: textArea; y: drawer.height;
                height: screen.height - drawer.height }
            PropertyChanges { target: arrowIcon; rotation: 0 }
        }

    ]
}
