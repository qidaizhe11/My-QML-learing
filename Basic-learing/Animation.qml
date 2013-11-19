import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

Rectangle {
    id: banner
    width: 150; height: 100
    border.color: "black"

    Column {
        anchors.centerIn: parent
        Text {
            id: code
            text: "Code less."
            opacity: 0.01
        }
        Text {
            id: create
            text: qsTr("Create more.")
            opacity: 0.01
        }
        Text {
            id: deploy
            text: qsTr("Deploy everywhere.")
            opacity: 0.01
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: playbanner.start()
    }

    SequentialAnimation {
        id: playbanner
        running: false
        NumberAnimation { target: code; property: "opacity"; to: 1.0; duration: 500; }
        NumberAnimation { target: create; property: "opacity"; to: 1.0; duration: 500; }
        NumberAnimation { target: deploy; property: "opacity"; to: 1.0; duration: 500; }
    }
}

//Rectangle {
//    width: 75; height: 75;
//    radius: width
//    id: ball
//    color: "salmon"

//    Behavior on x {
//        NumberAnimation {
//            id: bouncebehavior
//            easing: {
//                type: Easing.OutElastic
//                amplitude: 1.0
//                period: 0.5
//            }
//        }
//    }

//    Behavior on y {
//        animation: bouncebehavior
//    }
//    Behavior {
//        ColorAnimation { target: ball; duration: 100 }
//    }
//}

//Rectangle {
//    width: 100; height: 100
//    id: button
//    state: "RELEASED"

//    MouseArea {
//        anchors.fill: parent
//        onPressed: button.state = "PRESSED"
//        onReleased: button.state = "RELEASED"
//    }

//    states: [
//        State {
//            name: "PRESSED"
//            PropertyChanges { target: button; color: "lightblue" }
//        },
//        State {
//            name: "RELEASED"
//            PropertyChanges { target: button; color: "lightsteelblue" }
//        }

//    ]

//    transitions:
//        Transition {
//        to: "*"
//        ColorAnimation { target: button; duration: 100 }
//    }
//}

//Rectangle {
//    width: 100; height: 100
//    color: "red"

//    SequentialAnimation on color {
//        ColorAnimation { to: "yellow"; duration: 2000 }
//        ColorAnimation { to: "blue"; duration: 1000 }
//    }
//}

//Rectangle {
//    id: flashingblob
//    width: 75; height: 75
//    color: "blue"
//    opacity: 1.0

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            animateColor.start()
//            animateOpacity.start()
//        }
//    }

//    PropertyAnimation {
//        id: animateColor
//        target: flashingblob
//        properties: "color"
//        to: "green"
//        duration: 100
//    }

//    NumberAnimation {
//        id: animateOpacity
//        target: flashingblob
//        properties: "opacity"
//        from: 0.59
//        to: 1.0
//        duration: 500
//        loops: Animation.Infinite
//        easing: { type: Easing.OutBack; overshoot: 500 }
//    }
//}
