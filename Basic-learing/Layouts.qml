import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    width: 800
    height: 480

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 6
        Rectangle {
            color: "azure"
            Layout.fillWidth: true
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            Layout.minimumHeight: 150
            Text {
                anchors.centerIn: parent
                text: parent.width + "x" + parent.height
            }
        }
        Rectangle {
            color: "plum"
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
            Layout.preferredHeight: 100
            Text {
                anchors.centerIn: parent
                text: parent.width + "x" + parent.height
            }
        }
    }
}
