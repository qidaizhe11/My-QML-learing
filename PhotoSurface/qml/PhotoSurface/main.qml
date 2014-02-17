import QtQuick 2.0
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.1
import Qt.labs.folderlistmodel 1.0

Window {
    id: root
    visible: true
    width: 1024; height: 600
    color: "black"
    property int highest_z: 0
    property real default_size: 200

    FileDialog {
        id: file_dialog
        title: "Choose a folder with some images"
        selectFolder: true
        onAccepted: folder_model.folder = fileUrl + "/"
    }

    Repeater {
        model: FolderListModel {
            id: folder_model
            objectName: "folder_model"
            showDirs: false
            nameFilters: ["*.png", "*.jpg", "*.gif"]
        }
        Rectangle {
            id: photo_frame
            width: image.width * image.scale + 20
            height: image.height * image.scale + 20
            border.color: "black"
            border.width: 2
            smooth: true
            antialiasing: true
            x: Math.random() * root.width - default_size
            y: Math.random() * root.height - default_size
            rotation: Math.random() * 13 - 6
            Image {
                id: image
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: folder_model.folder + fileName
                scale: default_size / Math.max(sourceSize.width,
                                               sourceSize.height)
                antialiasing: true
            }
            PinchArea {
                anchors.fill: parent
                pinch.target: photo_frame
                pinch.minimumRotation: -360
                pinch.maximumRotation: 360
                pinch.minimumScale: 0.1
                pinch.maximumScale: 10
                onPinchFinished: photo_frame.border.color = "black"
                MouseArea {
                    id: drag_area
                    hoverEnabled: true
                    anchors.fill: parent
                    drag.target: photo_frame
                    onPressed: photo_frame.z = ++root.highest_z
                    onEntered: photo_frame.border.color = "red"
                    onExited: photo_frame.border.color = "black"
                    onWheel: {
                        if (wheel.modifiers & Qt.ControlModifier) {
                            photo_frame.rotation += wheel.angleDelta.y / 120 *5;
                            if (Math.abs(photo_frame.rotation) < 4)
                                photo_frame.rotation = 0;
                        } else {
                            photo_frame.rotation += wheel.angleDelta.x / 120;
                            if (Math.abs(photo_frame.rotation) < 0.6)
                                photo_frame.rotation = 0;
                            var scale_before = image.scale;
                            image.scale += image.scale * wheel.angleDelta.y /
                                    120 / 10;
                            photo_frame.x -= image.width *
                                    (image.scale - scale_before) / 2.0;
                            photo_frame.y -= image.height *
                                    (image.scale - scale_before) / 2.0;
                        }
                    }
                }
            }
        }
    }

    Image {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        source: "resources/folder.png"
        MouseArea {
            anchors.fill: parent
            anchors.margins: -10
            onClicked: file_dialog.open()
        }
    }

    Component.onCompleted: file_dialog.open()
}
