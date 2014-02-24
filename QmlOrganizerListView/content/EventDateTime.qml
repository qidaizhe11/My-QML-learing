import QtQuick 2.0

Rectangle {
    property alias date: eventDate.text
    property alias month: eventMonth.text
    property alias year: eventYear.text

    border.color: "lightblue"
    border.width: 2
    height: eventDate.height + eventMonth.height + eventYear.height * 1.3
    width: parent.width

    Grid {
        columns: 2
        spacing: 3

        Text {
            text: "Date:"
        }
        TextInput {
            id: eventDate
            validator: IntValidator {
                bottom: 1
                top: 31
            }
        }
        Text {
            text: "Month:"
        }
        TextInput {
            id: eventMonth
            validator: IntValidator {
                bottom: 1
                top: 12
            }
        }
        Text {
            text: "Year:"
        }
        TextInput {
            id: eventYear
            validator: IntValidator {
                bottom: 1970
                top: 2020
            }
        }
    }
}
