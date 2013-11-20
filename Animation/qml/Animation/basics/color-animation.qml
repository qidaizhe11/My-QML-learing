import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    id: window
    width: 480; height: 800

    // draw the sky
    Rectangle {
        anchors {
            left: parent.left; right: parent.right
            top: parent.top; bottom: parent.verticalCenter
        }

        gradient: Gradient {
            GradientStop {
                position: 0.0
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "DeepSkyBlue"; to: "#0E1533"; duration: 10000 }
                    ColorAnimation { from: "#0E1533"; to: "DeepSkyBlue"; duration: 10000 }
                }
            }
            GradientStop {
                position: 1.0
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "SkyBlue"; to: "#437284"; duration: 10000 }
                    ColorAnimation { from: "#437284"; to: "SkyBlue"; duration: 10000 }
                }
            }
        }
    }

    // the sun, moon and stars
    Item {
        width: parent.width; height: 2 * parent.height

        NumberAnimation on rotation {
            from: 0
            to: 360
            duration: 20000
            loops: Animation.Infinite
        }

        // TODO: 回头记得回来做个没有rotation, sun和moon固定位置交替显示的版本

        Image {
            source: "images/sun.png"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -3 * parent.rotation
        }
        Image {
            source: "images/moon.png"
            y: parent.height - 74
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -parent.rotation
        }
        ParticleSystem {
            id: particlesystem
            x: 0; y: parent.height / 2
//            x: 0; y: 0
            width: parent.width; height: parent.height / 2
            ImageParticle {
                source: "images/star.png"
                groups: ["star"]
                color: "#00333333"
                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    NumberAnimation { from: 0; to: 1; duration: 10000 }
                    NumberAnimation { from: 1; to: 0; duration: 10000 }
                }
            }
            Emitter {
                group: "star"
                anchors.fill: parent
                emitRate: parent.width / 50
                lifeSpan: 10000
            }
        }
    }

    // the ground
    Rectangle {
        anchors {
            left: parent.left; top: parent.verticalCenter
            right: parent.right; bottom: parent.bottom
        }
        gradient: Gradient {
            GradientStop {
                position: 0.0
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "ForestGreen"; to: "#001600"; duration: 10000 }
                    ColorAnimation { from: "#001600"; to: "forestgreen"; duration: 10000 }
                }
            }
            GradientStop { position: 1.0; color: "darkgreen" }
        }
    }
}
