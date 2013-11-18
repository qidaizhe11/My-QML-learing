import QtQuick 2.0
import QtQml.Models 2.1

Rectangle {
    id: menuBar
    width: 1000
    height: 300
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"

    property real partition: 1 / 10

    Column {
        anchors.fill: parent
        z: 1

        Rectangle {
            id: labelList
            height: menuBar.height * partition
            width: menuBar.width
            color: "beige"

            Row {
                id: labelRow
                anchors.centerIn: parent
                spacing: 40

                Button {
                    id: fileButton
                    width: 50; height: 20
                    buttonColor: menuListView.currentIndex == 0 ?
                                     fileColor :
                                     Qt.darker(fileColor, 1.5)
                    label: "File"
                    labelSize: menuListView.currentIndex == 0 ? 16 : 12
                    radius: 1

                    onButtonClick: menuListView.currentIndex = 0
                }

                Button {
                    id: editButton
                    width: 50; height: 20
                    buttonColor: menuListView.currentIndex == 1 ?
                                     Qt.darker(editColor, 1.5) :
                                     Qt.darker(editColor, 1.9)
                    label: "Edit"
                    labelSize: menuListView.currentIndex == 1 ? 16 : 12
                    radius: 1

                    onButtonClick: menuListView.currentIndex = 1
                }
            }
        }

        ListView {
            id: menuListView
            width: menuBar.width
            height: menuBar.height * partition * 9

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
            color: fileColor
        }
        EditMenu {
            id: editMenu
            width: menuListView.width
            height: menuListView.height
            color: editColor
        }
    }
}
