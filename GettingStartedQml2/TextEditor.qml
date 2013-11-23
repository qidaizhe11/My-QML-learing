import QtQuick 2.0
import "core"

Rectangle {
    id: screen
    width: 1000; height: 1000
    property int partition: height / 4

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
}
