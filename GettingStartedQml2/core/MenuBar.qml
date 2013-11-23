import QtQuick 2.0
import QtQml.Models 2.1

Rectangle {
    id: menuBar
    width: 1000; height: 300
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"
    property real partition: 1 / 6

    Column {
        anchors.fill: parent
        z: 1

        Rectangle {
            id: labelList
            height: menuBar.height * partition
            width: menuBar.width
            color: "beige"

            Text {
                height: parent.height
                anchors { right: labelRow.left; verticalCenter: parent.bottom }
                text: "menu:    "
                color: "lightblue"
                font { weight: Font.Light; italic: true }
            }

            Row {
                id: labelRow
                anchors.centerIn: parent
                spacing: 40

                Button {
                    id: fileButton
                    width: 50; height: 30
                    label: "File"
                    buttonColor: menuListView.currentIndex == 0 ?
                                     fileColor : Qt.darker(fileColor, 1.5)
                    scale: menuListView.currentIndex == 0 ? 1.25 : 1

                    onButtonClick: menuListView.currentIndex = 0
                }

                Button {
                    id: editButton
                    width: 50; height: 30
                    label: "Edit"
                    buttonColor: menuListView.currentIndex == 1 ?
                                     Qt.darker(editColor, 1.5) :
                                     Qt.darker(editColor, 1.9)
                    scale: menuListView.currentIndex == 1 ? 1.25 : 1

                    onButtonClick: menuListView.currentIndex = 1
                }
            }
        }

        ListView {
            id: menuListView
            width: menuBar.width
            height: 5 * menuBar.height * partition

            model: menuListModel

            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            flickDeceleration: 5000
            highlightFollowsCurrentItem: true
            highlightMoveDuration: 240
            highlightRangeMode: ListView.StrictlyEnforceRange
        }
    }

    ObjectModel {
        id: menuListModel

        FileMenu {
            id: fileMenu
            width: menuListView.width
            height: menuListView.height
//            color: fileColor
        }
        EditMenu {
            id: editMenu
            width: menuListView.width
            height: menuListView.height
        }
    }
}
