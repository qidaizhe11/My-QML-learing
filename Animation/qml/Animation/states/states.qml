import QtQuick 2.0

Rectangle {
    id: page
    width: 480; height: 800
    color: "#343434"

    Image {
        id: userIcon
        source: "qt-logo.png"
        x: topLeftRect.x; y: topLeftRect.y
    }

    Rectangle {
        id: topLeftRect

        anchors {left: parent.left; top: parent.top; leftMargin: 10; topMargin: 20 }
        width: 46; height: 54
        color: "transparent"; border.color: "gray"; radius: 6

        MouseArea { anchors.fill: parent; onClicked: page.state = '' }
    }

    Rectangle {
        id: middleRightRect

        anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: 20 }
        width: 46; height: 54
        color: "transparent"; border.color: "gray"; radius: 6

        MouseArea { anchors.fill: parent; onClicked: page.state = "middleRight" }
    }

    states: [
        State {
            name: "middleRight"
            PropertyChanges { target: userIcon; x: middleRightRect.x; y: middleRightRect.y }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "middleRight"
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce; duration: 1000 }
        },
        Transition {
            NumberAnimation { properties: "x,y"; duration: 200 }
        }

    ]
}
