import QtQuick 2.0

Item {
    id: window
    width: 320
    height: 480

    // draw the sky
    Rectangle {
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            bottom: parent.verticalCenter
        }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "DeepSkyBlue" }
            GradientStop { position: 1.0; color: "LightSkyBlue" }
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            top: parent.verticalCenter
            right: parent.right
            bottom: parent.bottom
        }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "forestgreen" }
            GradientStop { position: 1.0; color: "darkgreen" }
        }
    }

    // the shadow for the smiley face
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: smiley.minHeight + 58
        source: "images/shadow.png"

        scale: smiley.y * 0.5 / (smiley.minHeight - smiley.maxHeight)
    }

    Image {
        id: smiley
        property int maxHeight: window.height / 3
        property int  minHeight: 2 * window.height / 3

        anchors.horizontalCenter: parent.horizontalCenter
        y: minHeight
        source: "images/face-smile.png"

        SequentialAnimation on y {
            loops: Animation.Infinite

            NumberAnimation {
                from: smiley.minHeight; to: smiley.maxHeight
                easing.type: Easing.OutExpo
                duration: 300
            }
            NumberAnimation {
                from: smiley.maxHeight; to: smiley.minHeight
                easing.type: Easing.OutBounce
                duration: 1000
            }
            PauseAnimation { duration: 500 }
        }
    }
}
