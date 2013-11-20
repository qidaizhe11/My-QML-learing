import QtQuick 2.0

Rectangle {
    id: window
    width: 480; height: 800; color: "#232323"

//    property var easingCurve: [ 0.2, 0.2, 0.13]

    ListModel {
        id: easingTypes
        ListElement { name: "Easing.Liner"; type: Easing.Linear; ballColor: "DarkRed" }
        ListElement { name: "Easing.OutExpo"; type: Easing.OutExpo; ballColor: "Royalblue" }
        ListElement { name: "Easing.InOutExpo"; type: Easing.InOutExpo; ballColor: "mediumblue" }
    }

    Component {
        id: delegate

        Item {
            height: 56; width: window.width

            Text { text: name; anchors.centerIn: parent; color: "white" }

            Rectangle {
                id: slot1; color: "#121212"; x: 30; height: 46; width: 46
                border.color: "#343434"; border.width: 1; radius: 12
                antialiasing: true
                anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle {
                id: slot2; color: "#121212"; x: window.width - 76; height: 46; width: 46
                border.color: "#343434"; border.width: 1; radius: 12
                antialiasing: true
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                id: rect; x: 30; color: "#454545"
                border.color: "white"; border.width: 2
                height: 46; width: 46; radius: 12; antialiasing: true
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    onClicked: {
                        if (rect.state == '')
                            rect.state = "right";
                        else
                            rect.state = ''
                    }
                    anchors.fill: parent
                    anchors.margins: -5
                }

                states: State {
                    name: "right"
                    PropertyChanges { target: rect; x: window.width - 76; color: ballColor }
                }

                transitions: Transition {
                    NumberAnimation { properties: "x"; easing.type: type; duration: 1000 }
                    ColorAnimation { properties: "color"; easing.type: type; duration: 1000 }
                }
            }
        }
    }

    Flickable {
        anchors.fill: parent
        contentHeight: layout.height
        Column {
            id: layout
            Repeater { model: easingTypes; delegate: delegate }
        }
    }

//    function getBezierCurve(name)
//    {
//        if (name === "Easing.Bezier")
//            return easingCurve;
//        return [];
//    }
}
