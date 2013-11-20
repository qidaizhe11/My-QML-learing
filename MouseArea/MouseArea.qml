import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

Rectangle {
    id: box
    width: 480; height: 800

    Rectangle {
        id: redSquare
        width: 120; height: 120
        anchors.top: parent.top; anchors.left: parent.left; anchors.margins: 10
        color: "red"

        Text { text: "Click"; font.pixelSize: 16; anchors.centerIn: parent }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            property string buttonID

            acceptedButtons: Qt.AllButtons

            onEntered: info.text = "Entered"
            onExited: info.text = "Exited (pressed=" + pressed + ")"

            onPressed: {
                if (mouse.button == Qt.LeftButton)
                    buttonID = "LeftButton"
                else if (mouse.button == Qt.RightButton)
                    buttonID = "RightButton"

                info.text = 'Pressed (' + buttonID + ' shift='
                        + (mouse.modifiers & Qt.ShiftModifier ? 'true' : "false") + ")"
                var posInBox = redSquare.mapToItem(box, mouse.x, mouse.y)
                posInfo.text = + mouse.x + ',' + mouse.y + ' in square'
                        + ' (' + posInBox.x + ',' + posInBox.y + ' in window)'
            }
            onReleased: {
                btn.text = 'Released (isClick=' + mouse.isClick + ' wasHeld=' + mouse.wasHeld + ')'
                posInfo.text = ''
            }
        }
    }

    Text {
        id: info
        anchors.bottom: btn.top; anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20

        onTextChanged: console.log(text)
    }

    Text {
        id: btn
        anchors.bottom: posInfo.top; anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }

    Text {
        id: posInfo
        anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }
}
