import QtQuick 2.0

Rectangle {
    id: root
    property bool mirror
    property int direction: Qt.application.layoutDirection
    width: 480
    height: 800
    Column {
        id: columnA
        spacing: 10
        x: 10
        y: 10
        width: 200

        Item {
            id: rowCell
        }
        Text {
            text: "Row"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            layoutDirection: root.direction
            spacing: 10
            move: Transition {
                NumberAnimation {
                    properties: "x"
                }
            }
            Repeater {
                model: 3
                Loader {
                    property int value: index
                    sourceComponent: positionDelegate
                }
            }
        }

        Text {
            text: "Grid"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Grid {
            layoutDirection: root.direction
            spacing: 10; columns: 3
            move: Transition {
                NumberAnimation {
                    properties: "x"
                }
            }
            Repeater {
                model: 8
                Loader {
                    property int value: index
                    sourceComponent: positionDelegate
                }
            }
        }

        Text {
            text: "Flow"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Flow {
            layoutDirection: root.direction
            spacing: 10; width: parent.width
            move: Transition {
                NumberAnimation {
                    properties: "x"
                }
            }
            Repeater {
                model: 8
                Loader {
                    property int value: index
                    sourceComponent: positionDelegate
                }
            }
        }
    }

    Column {
        id: columnB
        spacing: 10
        x: 260
        y: 10

        Text {
            text: "ListView"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ListView {
            id: listView
            clip: true
            width: parent.width; height: 40
            layoutDirection: root.direction
            orientation: Qt.Horizontal
            model: 48
            delegate: viewDelegate
        }

        Text {
            text: "GridView"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        GridView {
            clip: true
            width: 150; height: 160
            cellHeight: 50; cellWidth: 50
            layoutDirection: root.direction
            model: 48
            delegate: viewDelegate
        }

        Rectangle {
            height: 50; width: parent.width
            color: mouseArea.pressed ? "black" : "gray"
            Column {
                anchors.centerIn: parent
                Text {
                    text: root.direction ? "Right to left" : "Left to right"
                    color: "white"
                    font.pixelSize: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    text: "(Click here to toggle)"
                    color: "white"
                    font.pixelSize: 10
                    font.italic: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    if (root.direction == Qt.LeftToRight ) {
                        root.direction = Qt.RightToLeft
                    } else {
                        root.direction = Qt.LeftToRight
                    }
                }
            }
        }

    }

    Component {
        id: positionDelegate
        Rectangle {
            width: 50; height: 50
            color: Qt.rgba(0.8 / (parent.value+1), 0.8 / (parent.value+1),
                           0.8 / (parent.value+1), 1.0)
            Text {
                text: parent.parent.value + 1
                color: "white"
                font.pixelSize: 18
                anchors.centerIn: parent
            }
        }
    }

    Component {
        id: viewDelegate
        Item {
            width: (listView.effectiveLayoutDirection == Qt.LeftToRight ?
                       (index == 48 -1) : (index == 0)) ? 40 : 50
            Rectangle {
                width: 40; height: 40
                color: Qt.rgba(0.5 + (48-index) * Math.random() / 48,
                               0.3 + index * Math.random() / 48,
                               0.3 * Math.random(),
                               1.0)
                Text {
                    text: index + 1
                    color: "white"
                    font.pixelSize: 18
                    anchors.centerIn: parent
                }
            }
        }
    }
}
