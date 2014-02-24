import QtQuick 2.0

Rectangle {
    signal clicked
    property alias buttonText: buttonLabel.text
    height: buttonLabel.height
    color: "blue"

    border.width: 1
    border.color: "blue"

    Text {
        id: buttonLabel
        font.pixelSize: 16
        anchors.centerIn: parent
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "white"
        onReleased: {
            parent.color = "blue"
            parent.clicked()
        }
    }
}
