import QtQuick 2.0
import People 1.0

BirthdayParty {
    host: Boy {
        name: "Bob Jones"
        shoeSize: 12
    }
    guests: [
        Boy { name: "Leo Hodges" },
        Boy { name: "Jack Smith" },
        Boy { name: "Anne Brown" }
    ]
}

//BirthdayParty {
//    host: Person {
//        name: "Bob Jones"
//        shoeSize: 12
//    }
//    guests: [
//        Person { name: "Leo Hodges" },
//        Person { name: "Jack Smith" },
//        Person { name: "Anne Brown" }
//    ]
//}

//Person {
//    name: "Bob Jones"
//    shoeSize: 12
//}

//Rectangle {
//    width: 360
//    height: 360
//    Text {
//        text: qsTr("Hello World")
//        anchors.centerIn: parent
//    }
//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            Qt.quit();
//        }
//    }
//}
