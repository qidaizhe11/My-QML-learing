import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    width: parent.width
    height: parent.height

    property real progress: 0
    SequentialAnimation on progress {
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            from: 0
            to: 1
            duration: 3000
        }
        NumberAnimation {
            from: 1
            to: 0
            duration: 3000
        }
    }

    Column {
        spacing: 40
        anchors.centerIn: parent

        Button {
            anchors.margins: 20
            text: "Press me"
            style: touchStyle
        }

        Button {
            anchors.margins: 20
            text: "press me too"
            style: touchStyle
        }

        Button {
            anchors.margins: 20
            style: touchStyle
            text: "Dont press me"
            onClicked: if (stackView) stackView.pop()
        }
    }

    Component {
        id: touchStyle
        ButtonStyle {
            panel: Item {
                implicitHeight: 50
                implicitWidth: 320
                BorderImage {
                    source: control.pressed ? "../../../images/button_pressed.png":
                                              "../../../images/button_default.png"
                    border.left: 8; border.top: 8
                    border.right: 8; border.bottom: 8
                    anchors.fill: parent
                    antialiasing: true
                    anchors.margins: control.pressed ? -4 : 0
                    Text {
                        text: control.text
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 23
                        renderType: Text.NativeRendering
                    }
                }
            }
        }
    }
}
