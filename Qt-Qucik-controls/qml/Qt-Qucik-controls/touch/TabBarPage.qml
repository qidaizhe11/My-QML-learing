import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    width: parent.width
    height: parent.height

    TabView {
        anchors.fill: parent
        style: touchStyle
        Tab {
            title: "Buttons"
            ButtonPage { visible: true  }
        }
        Tab {
            title: "Progress"
            ProgressBarPage { visible: true }
        }
    }

    Component {
        id: touchStyle
        TabViewStyle {
            tabsAlignment: Qt.AlignVCenter
            tabOverlap: 0
            frame: Item { }
            tab: Item {
                implicitWidth: control.width / control.count
                implicitHeight: 50
                BorderImage {
                    anchors.fill: parent
                    border.bottom: 8
                    border.top: 8
                    source: styleData.selected ? "../../../images/tab_selected.png" :
                                                 "../../../images/tabs_standard.png"
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: styleData.title.toUpperCase()
                        font.pixelSize: 16
                    }
                }
            }
        }
    }
}
