import QtQuick 2.0
import QtOrganizer 5.0
import "content"

Rectangle {
    id: organizerApplication
    width: 400
    height: 600
    state: "EventListView"

    function createEmptyItem() {
        var newEvent = Qt.createQmlObject("import QtOrganizer 5.0; Event {}",
                                          organizer);
        newEvent.displayLabel = "NEW Event";
        newEvent.startDateTime = new Date();
        newEvent.endDateTime = new Date();
        return newEvent;
    }

    function setListViewMouseItem(mouseX, mouseY) {
//        var indexdItem = eventvi
    }

    Rectangle {
        id: organizerTitle
        border.color: "lightblue"
        border.width: 4
//        radius: 5
        anchors.top: parent.top
//        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        height: organizerTitleLabel.height

        Text {
            id: organizerTitleLabel

            height: font.pixelSize + 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Organizer Events"
//            font.pixelSize: style.fontPixelSize * 1.3
            font.pixelSize: 20
        }
    }

    Rectangle {
        id: organizerRectangle
        anchors.top: organizerTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: organizerApplication.height - organizerTitle.height -
                eventButtons.height
        color: "white"

        Component {
            id: eventHighLight
            Rectangle {
                height: eventView.currentItem.height
                width: organizerRectangle.width
                color: "lightsteelblue"
                border.color: "blue"
                border.width: 1

                y: eventView.currentItem.y
                Behavior on y {
                    SpringAnimation {
                        spring: 3
                        damping: 0.2
                    }
                }
            }
        }

        ListView {
            id: eventView
            anchors.fill: parent
            clip: true
            property bool readOnlyEvent: true

            delegate: eventDelegate
            model: organizer
            focus: true
            highlight: eventHighLight

            MouseArea {
                anchors.fill: parent
                id: listViewMouseArea
                onClicked: {
                    setListViewMouseItem(mouseX, mouseY)
                    organizerApplication.state = "EventEditorView"
                    eventEditor.eventItem =
                            organizer.items[eventView.currentIndex]
                }
            }
        }
    }

    OrganizerModel {
        id: organizer
        startPeriod: new Date("1970-01-01")
        endPeriod: new Date("2014-12-31")
        manager: "memory"

        Component.onCompleted: {
            organizer.importItems(Qt.resolvedUrl(
                                      "content/qidaizhe11@gmail.com-2.ics"))
        }
    }

    Component {
        id: eventDelegate

        Column {
            id: eventDelegateWrapper
            width: organizerRectangle.width
            height: ListView.isCurrentItem ?
                        (displayLabel.height + startTime.height +
                         endTime.height) * 1.6 :
                        (displayLabel.height + startTime.height +
                         endTime.height) * 1.2


            Grid {
                columns: 2
                spacing: 3

                Text {
                    font.pixelSize: 14
                    text: "Event: "
                }
                TextEdit {
                    id: displayLabel
                    font.pixelSize: 14
                    text: (model.item) ? model.item.displayLabel : ""
                    readOnly: true
                }
                Text {
                    font.pixelSize: 12
                    text: "Start: "
                }
                TextEdit {
                    id: startTime
                    font.pixelSize: 12
                    text: (model.item) ?
                              Qt.formatDate(model.item.startDateTime) : ""
                    readOnly: true
                }
                Text {
                    font.pixelSize: 12
                    text: "End: "
                }
                TextEdit {
                    id: endTime
                    font.pixelSize: 12
                    text: (model.item) ?
                              Qt.formatDate(model.item.endDateTime) : ""
                    readOnly: true
                }
            }
        }
    }

    Row {
        id: eventButtons
        spacing: 2
        anchors.top: organizerRectangle.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        GenericButton {
            width: parent.width / 2
            buttonText: "Add New Event"
            onClicked: {
                organizerApplication.state = "EventEditorView"
                eventEditor.eventItem = organizerApplication.createEmptyItem()
            }
        }
    }

    EventEditor {
        id: eventEditor
        anchors.fill: parent
        color: "white"
    }

    states: [
        State {
            name: "EventListView"
            PropertyChanges {
                target: eventEditor
                visible: false
            }
            PropertyChanges {
                target: eventView
//                visi
            }
        }

    ]
}

