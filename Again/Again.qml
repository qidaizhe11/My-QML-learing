import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480

    GridLayout {
        id: mainLayout
        anchors.fill: parent
        columns: 7
        flow: GridLayout.LeftToRight

//        Text {
//            text: "Date"
//            anchors.horizontalCenter: parent.horizontalCenter
//        }

        Repeater {
            model: 7 * 6
            Loader {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.minimumHeight: 60
//                Layout.preferredWidth: 80
                Layout.rowSpan: 3

                property int value: index
                sourceComponent: dateDelegate
            }
        }


    }

    Rectangle {
        z: 1
        width: parent.width / 7 * 3
        height: parent.height / 18
        x: parent.width / 7 * 2
        y: parent.height / 18 * 7
        color: "lightblue"
        Text {
            text: "I am here, always."
            anchors.verticalCenter: parent.verticalCenter
        }
    }

//    GridLayout {
//        id: eventLayout
//        anchors.fill: parent
//        columns: 7
//        rows: 18
//        flow: GridLayout.LeftToRight
//        z: 0

//        Rectangle {
//            z: 1
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            Layout.minimumHeight: 20
//            Layout.minimumWidth: 20
//            Layout.column: 3
//            Layout.row: 5
//            Layout.rowSpan: 1
//            Layout.columnSpan: 3
//            color: "lightblue"
//            Text {
//                text: "yes, just for fun"
//            }
//        }
//    }

    Component {
        id: dateDelegate
        Rectangle {
//            width: 40; height: 4
            color: "darkgray"
            Text {
                text: parent.parent.value
                color: "white"
                font.pixelSize: 16
                anchors {
                    left: parent.left; top: parent.top
                    leftMargin: 6; topMargin: 6
                }
            }
        }
    }
}
