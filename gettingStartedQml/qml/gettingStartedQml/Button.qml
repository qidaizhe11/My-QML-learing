import QtQuick 2.0

Rectangle {
    id: button

    property int buttonHeight: 75
    property int buttonWidth: 150

    property string label

    property color textcolor: buttonLabel.color

    property color buttonColor: "lightblue"
    property color onHoverColor: "lightsteelblue"
    property color borderColor: "transparent"

    property real labelSize: 14

    radius: 6
    antialiasing: true
    border.width: 2
    border.color: borderColor
    width: buttonWidth
    height: buttonHeight

    signal buttonClick()

//    onButtonClick: {
//        console.log(buttonLabel.text + " clicked")
//    }

    Text {
        id: buttonLabel
        text: label
        color: "#DCDCCC"
        anchors.centerIn: parent
        font.pointSize: labelSize
    }

    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent
        onClicked: buttonClick()
        hoverEnabled: true
        onEntered: parent.border.color = onHoverColor
        onExited: parent.border.color = borderColor
    }

    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor

    scale: buttonMouseArea.pressed ? 1.1 : 1.0
}
