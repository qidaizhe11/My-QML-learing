import QtQuick 2.0

Rectangle {
    width: 200; height: 200

    ListModel {
        id: fruitModel
        property string language: "en"
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }

    Component {
        id: fruitDelegate
        Row {
            id: fruit
            Text { text: " Fruit: " + name; color: fruit.ListView.view.fruit_color }
            Text { text: " Cost: $" + cost }
            Text { text: " Language: " + fruit.ListView.view.model.language }
        }
    }

    ListView {
        property color fruit_color: "green"
        model: fruitModel
        delegate: fruitDelegate
        anchors.fill: parent
    }
}

//Rectangle {
//    width: 800
//    height: 480

//    ListModel {
//        id: nameModel
//        ListElement { name: "Alice" }
//        ListElement { name: "Bob" }
//        ListElement { name: "Jane" }
//        ListElement { name: "Harry" }
//        ListElement { name: "Wendy" }
//    }

//    Component {
//        id: nameDelegate
//        Text {
//            text: name;
//            font.pixelSize: 24
//        }
//    }

//    ListView {
//        anchors.fill: parent
//        clip: true
//        model: nameModel
//        delegate: nameDelegate
//        header: bannerComponent
//        footer: Rectangle {
//            width: parent.width; height: 30
//            gradient: clubcolors
//        }

//        highlight: Rectangle {
//            width: parent.width
//            color: "lightgray"
//        }
//    }

//    Component {
//        id: bannerComponent
//        Rectangle {
//            id: banner
//            width: parent.width; height: 50
//            gradient: clubcolors
//            border { color: "#9EDDF2"; width: 2 }
//            Text {
//                anchors.centerIn: parent
//                text: qsTr("Club Members")
//                font.pixelSize: 32
//            }
//        }
//    }

//    Gradient {
//        id: clubcolors
//        GradientStop { position: 0.0; color: "#8EE2FE" }
//        GradientStop { position: 0.66; color: "#7ED2EE" }
//    }
//}

