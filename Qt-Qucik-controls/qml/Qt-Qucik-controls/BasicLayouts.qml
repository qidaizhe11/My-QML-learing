import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    title: "Basic Layouts"
    property int margin: 11
    width: mainLayout.implicitWidth + 2 *margin
    height: mainLayout.implicitHeight + 2 * margin
    minimumWidth: mainLayout.Layout

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: margin
        GroupBox {
            id: rowBox
            title: qsTr("package selectin")
            flat: true
            Layout.fillWidth: true

            RowLayout {
                id: rowLayout
                anchors.fill: parent
                TextField {
                    placeholderText: "This want to grow horizontally"
                    Layout.fillWidth: true
                }
                Button {
                    text: "Button"
                }
            }
        }

        GroupBox {
            id: groupBox
            title: "Grid layout"
            Layout.fillWidth: true

            GridLayout {
                id: gridLayout
                rows: 3
                flow: GridLayout.TopToBottom
                anchors.fill: parent

                Label { text: "Line 1" }
                Label { text: "Line 2" }
                Label { text: "Line 3" }

                TextField { }
                TextField { }
                TextField { }

                TextArea {
                    text: "This widget spans over three in the GridLayout.\n"
                          + "All items in the GridLayout are implicitly"
                          + "positioned from top to bottom."
                    Layout.rowSpan: 3
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        TextArea {
            id: t3
            text: "This fills the whole cell"
            Layout.minimumHeight: 30
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
