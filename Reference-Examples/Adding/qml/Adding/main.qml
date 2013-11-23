import QtQuick 2.0
import People 1.0

//Person {
//    name: "Bob Jones"
//    shoeSize: 12
//}

Rectangle {
    width: 360
    height: 360
    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
}
