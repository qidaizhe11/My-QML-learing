import QtQuick 2.0

Rectangle {
    id: button

    property color buttonColor: "lightblue"
    property color onHoverColor: "gold"
    property color borderColor: "white"

//    color: buttonColor
    width: 150
    height: 75

    signal buttonClick()

    onButtonClick: {
        console.log(buttonLabel.text + " clicked")
    }

    Text {
        id: buttonLabel
        text: qsTr("button label")
        anchors.centerIn: parent
    }

    MouseArea {
        id: buttonMouseArea
        onClicked: buttonClick()
        hoverEnabled: true
        onEntered: parent.border.color = onHoverColor
        onExited: parent.border.color = borderColor
    }

    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
}
