import QtQuick 2.0

Rectangle {
    id: editMenu
    width: 1000; height: 480
    color: "powderblue"
    property color buttonBorderColor: "#7a8182"
    property color buttonFillColor: "#61bdcacd"
    property string menuName: "Edit"

//    gradient: Gradient {
//        GradientStop { position: 0.0; color: "#6a7570" }
//        GradientStop { position: 1.0; color: Qt.darker("#6a7570") }
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
                label: "Copy"
            }
            Button {
                id: saveButton
                label: "Paste"
            }
            Button {
                id: exitButton
                label: "Select All"
            }
        }
    }
}
