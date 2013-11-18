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

//        Rectangle {

//        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Buttons"
            page: "ButtonPage.qml"
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
