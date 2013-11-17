import QtQuick 2.0

Rectangle {
    id: textArea
    width: 400
    height: 400

    function paste() { textEdit.paste() }
    function copy() { textEdit.copy() }
    function selectAll() { textEdit.selectAll() }

    property color fontColor: "white"
    property alias textContent: textEdit.text

    Flickable {
        id: flickArea
        width: parent.width
        height: parent.height
        anchors.fill: parent

        function ensureVisible(r) {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX + width <= r.x + r.width)
                contentX = r.x + r.width - width;
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY + height <= r.y + r.height)
                contentY = r.y + r.height - height;
        }

        TextEdit {
            id: textEdit
            width: parent.width
            height: parent.height
            anchors.fill: parent
            color: fontColor
            focus: true
            wrapMode: TextEdit.Wrap
            font.pointSize: 10
            onCursorRectangleChanged: flickArea.ensureVisible(cursorRectangle)
            selectByMouse: true
        }
    }
}
