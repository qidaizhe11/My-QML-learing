import QtQuick 2.0
import People 1.0

BirthdayParty {
    host: Boy {
        name: "Bob Jones"
        shoe { size: 12; color: "white"; brand: "Bikey"; price: 90 }
        BirthdayParty.rsvp: "2009-07-01"
    }

    Boy {
        name: "Leo Hodges"
        shoe { size: 10; color: "black"; brand: "Thebok"; price: 59.95 }
        BirthdayParty.rsvp: "2009-07-06"
    }

    Boy {
        name: "Jack Smith"
        shoe { size: 8; color: "blue"; brand: "Luma"; price: 19.95 }
    }

    Girl {
        name: "Anne Brown"
        shoe.size: 7
        shoe.color: "red"
        shoe.brand: "Job Macobs"
        shoe.price: 699.99
    }

//    Boy { name: "Leo Hodges" }
//    Boy { name: "Jack Smith" }
//    Girl { name: "Anne Brown" }

    Component.onCompleted: invite("William Green")
}

//BirthdayParty {
//    host: Boy {
//        name: "Bob Jones"
//        shoeSize: 12
//    }
//    guests: [
//        Boy { name: "Leo Hodges" },
//        Boy { name: "Jack Smith" },
//        Boy { name: "Anne Brown" }
//    ]
//}


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
