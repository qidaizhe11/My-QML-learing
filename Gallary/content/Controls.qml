import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    id: flickbale
    anchors.fill: parent
    enabled: enabledCheck.checked

    property int tabPosition: tabPositonGroup.current == r2 ? Qt.BottomEdge : Qt.TopEdge

    Row {
        id: contentRow
        anchors.fill: parent
        anchors.margins: 8
        spacing: 16
        Column {
            id: firstColumn
            spacing: 9
            Row {
                spacing: 8
                Button {
                    id: button1
                    text: "Button 1"
                    width: 92
                    tooltip: "This is an interesting tool tip"
                }
                Button {
                    id: button2
                    text: "Button 2"
                    width: 102
                    menu: Menu {
                        MenuItem { text: "This Button" }
                        MenuItem { text: "Happens To Have" }
                        MenuItem { text: "A Menu Assigned" }
                    }
                }
            }
            ComboBox {
                id: combo;
                model: choices;
                width: parent.width;
                currentIndex: 2
            }
            Row {
                spacing: 8
                SpinBox {
                    id: t1
                    width: 97
                    minimumValue: -50
                    value: -20
                }
                SpinBox {
                    id: t2
                    width: 97
                }
            }
            TextField {
                id: t3
                placeholderText: "This is a placeholder for a textfield"
                width: 200
            }
            ProgressBar {
                value: (slider.value - slider.minimumValue) /
                       (slider.maximumValue - slider.minimumValue)
            }
            ProgressBar {
                indeterminate: true
            }
            Slider {
                id: slider
                value: 0.5
                width: 200
                tickmarksEnabled: tickmarkCheck.checked
            }
        }
        Column {
            id: rightcol
            spacing: 12
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            GroupBox {
                id: group1
                title: "CheckBox"
                width: area.width
                Row {
                    CheckBox {
                        id: frameCheckbox
                        text: "Text frame"
                        checked: true
                        width: 100
                    }
                    CheckBox {
                        id: tickmarkCheck
                        text: "Tickmarks"
                        checked: false
                    }
                    CheckBox {
                        id: wrapCheck
                        text: "Word wrap"
                        checked: true
                    }
                }
            }
            GroupBox {
                id: group2
                title: "Tab Position"
                width: area.width
                Row {
                    ExclusiveGroup { id: tabPositonGroup }
                    RadioButton {
                        id: r1
                        text: "Top"
                        exclusiveGroup: tabPositonGroup
                        checked: true
                        width: 100
                    }
                    RadioButton {
                        id: r2
                        text: "Bottom"
                        exclusiveGroup: tabPositonGroup
                    }
                }
            }

            TextArea {
                id: area
                frameVisible: frameCheckbox.checked
                text: "You are beautiful"
                wrapMode: wrapCheck.checked ? TextEdit.WordWrap : TextEdit.NoWrap
                width: contentRow.width - firstColumn.width - contentRow.spacing
                height: parent.height - group1.height - 2 * parent.spacing
                anchors.right: parent.right
            }
        }
    }
}
