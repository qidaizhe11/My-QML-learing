import QtQuick 2.0

Rectangle {
    id: textArea

//    function paste() {

    width: 400; height: 400

    property color fontColor: "white"
    property alias textContent: textEdit.text

    Flickable {
        id: flickArea
        width: parent.width
        height: parent.height
        anchors.fill: parent
        interactive: true

        TextEdit {
            id: textEdit
            anchors.fill: parent
            width: parent.width
            height: parent.height
            color: fontColor
            focus: true
            wrapMode: TextEdit.Wrap
            font.pointSize: 14
            selectByMouse: true
        }
    }
}
