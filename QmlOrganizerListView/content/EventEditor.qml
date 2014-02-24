import QtQuick 2.0

Rectangle {
    property variant eventItem

    function saveItem() {
        eventItem.displayLabel = displayLabel.text;
        eventItem.startDateTime = new Date(startEvent.year + "," +
                                           startEvent.month + "," +
                                           startEvent.date);
        eventItem.endDateTime = new Date(endEvent.year + "," +
                                         endEvent.month + "," +
                                         endEvent.date);
        organizer.saveItem(eventItem);
    }

    Column {
        anchors.fill: parent
        spacing: 5

        Column {
            spacing: 2

            Text {
                id: editorTitleLabel
                text: "Event Label:"
            }
            Rectangle {
                id: organizerTitle
                border.color: "lightblue"
                border.width: 2
                width: displayLabel.width
                height: displayLabel.height
                TextEdit {
                    id: displayLabel
                    text: (eventItem) ? eventItem.displayLabel : ""
                }
            }
        }

        Text {
            text: "Start:"
        }
        EventDateTime {
            id: startEvent
            date: Qt.formatDate((eventItem) ? eventItem.startDateTime : "",
                                              "dd")
            month: Qt.formatDate((eventItem) ? eventItem.startDateTime : "",
                                               "MM")
            year: Qt.formatDate((eventItem) ? eventItem.startDateTime : "",
                                              "yyyy")
        }

        Text {
            text: "End:"
        }
        EventDateTime {
            id: endEvent
            date: Qt.formatDate((eventItem) ? eventItem.endDateTime : "", "dd")
            month: Qt.formatDate((eventItem) ? eventItem.endDateTime : "", "MM")
            year: Qt.formatDate((eventItem) ? eventItem.endDateTime : "",
                                              "yyyy")
        }
    }

    Row {
        spacing: 2
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        GenericButton {
            width: parent.width / 3
            buttonText: "Cancel"
            onClicked: {
                organizerApplication.state = "EventListView"
            }
        }

        GenericButton {
            width: parent.width / 3
            buttonText: "Delete"
            onClicked: {
                organizerApplication.state = "EventListView"
                organizer.removeItem(eventItem)
            }
        }

        GenericButton {
            width: parent.width / 3
            buttonText: "Save"
            onClicked: {
                saveItem()
                organizerApplication.state = "EventListView"
            }
        }
    }
}
