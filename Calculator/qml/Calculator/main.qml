import QtQuick 2.0

Rectangle {
    id: window
    width: 480
    height: 800
    focus: true
    color: "#272822"

    onWidthChanged: controller.reload()

    Item {
        id: pad
        width: 260
        NumberPad { y: 10; anchors.horizontalCenter: parent.horizontalCenter }
    }

    AnimationController {
        id: controller
        animation: ParallelAnimation {
            id: anim
            NumberAnimation { target: display; property: "x"; duration: 400;
                from: -16; to: window.width - display.width; easing.type: Easing.InOutQuad }
            NumberAnimation { target: pad; property: "x"; duration: 400;
                from: window.width - pad.width; to: 0; easing.type: Easing.InOutQuad }
            SequentialAnimation {
                NumberAnimation { target: pad; property: "scale"; duration: 200;
                    from: 1; to: 0.97; easing.type: Easing.InOutQuad }
                NumberAnimation { target: pad; property: "scale"; duration: 200;
                    from: 1; to: 0.97; easing.type: Easing.InOutQuad }
            }
        }
    }

    Display {
        id: display
        x: -16
        width: window.width - pad.width
        height: parent.height


    }
}
