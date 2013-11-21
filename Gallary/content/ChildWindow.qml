import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Controls 1.0

Window {
    id: window1

    width: 400
    height: 400

    title: "child window"
    flags: Qt.Dialog

    Rectangle {
        color: syspal.window
        anchors.fill: parent

        Text {
            id: dimensionsText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: availableDimensionsText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dimensionsText.bottom
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: closeText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: availableDimensionsText.bottom
            text: "This is a new Window, press the\nbutton below to close it again."
        }
    }
}

