import QtQuick 2.0

Rectangle {
    id: screen
    width: 1000
    height: 600
    property int partition: height / 5
    state: "DRAWED_CLOSED"

    MenuBar {
        id: menuBar
        height: screen.partition
        width: screen.width
        z: 1
    }

    TextArea {
        id: textArea
        color: "#3F3F3F"
        fontColor: "#DCDCCC"
        y: partition
        height: partition * 4
        width: parent.width
    }

    states: [
        State {
            name: "DRAWER_CLOSED"
            PropertyChanges { target: menuBar; y: -height; }
            PropertyChanges { target: textArea; y: 0; height: screen.height }
        }
    ]
}
