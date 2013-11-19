import QtQuick 2.0

Rectangle {
    width: 400
    height: 400

    Rectangle {
        id: colorRect
        width: 100; height: 100
        anchors.centerIn: parent
//        color: "red"

        color: mouser.containsMouse ? "green" : "red"
        Behavior on color {
            ColorAnimation {}
        }

        MouseArea {
            id: mouser
            anchors.fill: parent
            hoverEnabled: true
        }

//        states: State {
//            name: "GreenState"
//            when: mouser.containsMouse

//            PropertyChanges {
//                target: colorRect
//                color: "green"
//            }
//        }

//        transitions: Transition {
//            ColorAnimation {}
//        }
    }
}

//这里有个bug，参见官方Using Qt Quick Behaviors with States文档

//Rectangle {
//    width: 400
//    height: 400
//    Rectangle {
//        id: colorRect
//        width: 100; height: 100
//        anchors.centerIn: parent
//        color: "red"

//        Behavior on color {
//            ColorAnimation {}
//        }

//        MouseArea {
//            id: mouser
//            anchors.fill: parent
//            hoverEnabled: true
//        }

//        states: State {
//            name: "GreenState"
//            when: mouser.containsMouse

//            PropertyChanges {
//                target: colorRect
//                color: "green"
//            }
//        }
//    }
//}
