import QtQuick 2.0

Rectangle {
    id: container

    property alias text: label.text

    signal clicked

    width: label.width + 20; height: label.height + 6
    antialiasing: true

    gradient: Gradient {
        GradientStop { id: gradientStop; position: 0.0; color: "#eeeeee" }
        GradientStop { position: 1.0; color: "#888888" }
    }

    Text {
        id: label
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: { container.clicked() }
    }

    states: State {
        name: "pressed"
        when: mouseArea.pressed
        PropertyChanges { target: gradientStop; color: "#333333" }
    }
}
