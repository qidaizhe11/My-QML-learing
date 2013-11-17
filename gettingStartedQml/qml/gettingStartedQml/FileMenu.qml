import QtQuick 2.0

Rectangle {
    id: fileMenu
    width: 1000
    height: 480

    color: "#6C646A"

    Row {
        anchors.centerIn: parent
        spacing: parent.width / 6

        Button {
            id: loadButton
            buttonColor: "lightgrey"
            label: "Load"
        }
        Button {
            id: saveButton
            buttonColor: "grey"
            label: "Save"
        }
        Button {
            id: exitButton
            buttonColor: "darkgrey"
            label: "Exit"

            onButtonClick: Qt.quit()
        }
    }
}
