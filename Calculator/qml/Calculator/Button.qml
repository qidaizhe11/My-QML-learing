import QtQuick 2.0

Item {
    property alias text: textItem.text
    property alias color: textItem.color

    property bool operator: false

    signal clicked

    width: 30
    height: 50

    Text {
        id: textItem
        font.pixelSize: 48
        wrapMode: Text.WordWrap
        lineHeight: 0.75
        color: "white"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        anchors.margins: -5
        onClicked: {
//            if (operator)
//                window
        }
    }
}
