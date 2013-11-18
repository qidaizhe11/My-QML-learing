import QtQuick 2.1
import QtQuick.Controls 1.0

ApplicationWindow {
    width: 480
    height: 800

    Rectangle {
        color: "#212126"
        anchors.fill: parent
    }

    toolBar: BorderImage {
        border.bottom: 8
        source: "../../../images/toolbar.png"
        width: parent.width
        height: 100

        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation {} }

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "../../../images/navigation_previous_item.png"
            }

            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: stackView.pop()
            }
        }

        Text {
            font.pixelSize: 42
            Behavior on x { NumberAnimation { easing.type: Easing.OutCubic } }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: "Widget Gallery"
        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Buttons"
            page: "ButtonPage.qml"
        }
        ListElement {
            title: "ProgressBar"
            page: "ProgressBarPage.qml"
        }
        ListElement {
            title: "Tabs"
            page: "TabBarPage.qml"
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {
                    text: title
                    onClicked: stackView.push(Qt.resolvedUrl(page))
                }
            }
        }
    }
}
