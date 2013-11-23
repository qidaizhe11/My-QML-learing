import QtQuick 2.0

Rectangle {
    id: fileMenu
    height: 480; width: 1000
    property color buttonBorderColor: "#7f8487"
    property color buttonFillColor: "#8fbdcacd"
    property string menuName: "File"

    color: "#6c646a"
//    gradient: Gradient {
//        GradientStop { position: 0.0; color: "#6c646a" }
//        GradientStop { position: 1.0; color: Qt.darker("#6c646a") }
//    }

    Rectangle {
        id: actionContainer
        color: "transparent"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height / 5

        Row {
            anchors.centerIn: parent
            spacing: parent.width / 9
            Button {
                id: loadButton
                label: "Load"
            }
            Button {
                id: saveButton
                label: "Save"
            }
//            Button {
//                id: newButton
//                label: "New"
//            }
            Button {
                id: exitButton
                label: "Exit"

                onButtonClick: Qt.quit()
            }
        }
    }
}
