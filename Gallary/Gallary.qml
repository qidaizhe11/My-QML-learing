import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import "content"

ApplicationWindow {
    title: "Component Gallery"

    width: 600
    height: 400
    minimumHeight: 400
    minimumWidth: 570

    ImageViewer { id: imageViewer }

//    FileDialog {
//        id: fileDialog
//        nameFilters: [ "Image files (*.png *.jpg)"]
//        onAccepted: imageViewer.open(fileUrl)
//    }

    Action {
        id: openAction
        text: "&Open"
        shortcut: "Ctrl+O"
        iconSource: "images/document-open.png"
//        onTriggered: fileDialog.open()
        tooltip: "Open an image"
    }

    Action {
        id: copyAction
        text: "&Copy"
        shortcut: "Ctrl+C"
        iconName: "edit-copy"
        enabled: (!!activeFocusItem && !!activeFocusItem["copy"])
        onTriggered: activeFocusItem.copy()
    }

    ExclusiveGroup {
        id: textFormatGroup

        Action {
            id: a1
            text: "Align Left"
            checkable: true
            Component.onCompleted: checked = true
        }
        Action {
            id: a2
            text: "Center"
            checkable: true
        }
        Action {
            id: a3
            text: "Align Right"
            checkable: true
        }
    }

    ChildWindow { id: window1 }

    Menu {
        id: editmenu
        MenuItem { action: copyAction }
        MenuSeparator {}
        Menu {
            title: "Font Style"
            MenuItem { text: "Bold"; checkable: true }
            MenuItem { text: "Italic"; checkable: true }
            MenuItem { text: "Underline"; checkable: true }
        }
    }

    toolBar: ToolBar {
        id: toolbar
        RowLayout {
            id: toolbarLayout
            spacing: 0
            width: parent.width
            ToolButton {
                iconSource: "images/window-new.png"
                onClicked: window1.visible = !window1.visible
                Accessible.name: "New window"
                tooltip: "Toggle visibility of the second window"
            }
            ToolButton { action: openAction }
            Item { Layout.fillWidth: true }
            CheckBox {
                id: enabledCheck
                text: "Enabled"
                checked: true
            }
        }
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem { action: openAction }
            MenuItem {
                text: "Close"
                shortcut: "Ctrl+Q"
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "&Edit"
            MenuItem { action: copyAction }
        }
    }

    SystemPalette { id: syspal }
    color: syspal.window

    ListModel {
        id: choices
        ListElement { text: "Banana" }
        ListElement { text: "Orange" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
    }

    TabView {
        id: frame
        enabled: enabledCheck.checked
        tabPosition: controlPage.item ? controlPage.item.tabPosition : Qt.TopEdge
        anchors.fill: parent
        anchors.margins: Qt.platform.os === "osx" ? 12 : 2

        Tab {
            id: controlPage
            title: "Control"
            Controls { }
        }
        Tab {
            title: "Itemviews"
            ModelView { }
        }
        Tab {
            title: "Styles"
        }
        Tab {
            title: "Layouts"
        }
    }
}
