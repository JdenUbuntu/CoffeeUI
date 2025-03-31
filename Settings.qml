import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2

Item {
    width: 640
    height: 480

    // Title
    Text {
        text: "Settings"
        font.pixelSize: 40
        font.family: "Verdana"
        color: "white"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
    }

    // GridView for settings
    GridView {
        id: settingsGrid
        anchors.top: parent.top
        anchors.topMargin: 101
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 44
        anchors.bottomMargin: 61
        anchors.leftMargin: 95
        cellWidth: 160
        cellHeight: 160
        model: settingsModel
        delegate: Item {
            width: 140
            height: 140

            Rectangle {
                anchors.fill: parent
                color: "#333"
                radius: 10
                border.color: "#aaa"
                border.width: 1

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (name === "Rinse"){
                             stackView.push("qrc:/Rinse.qml", { stackview: stackView })
                        }
                        else if (name === "Shut Down"){
                             stackView.push("qrc:/Shutdown.qml", { stackview: stackView })
                        }
                    }
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Image {
                        source: icon
                        width: 64
                        height: 64
                    }

                    Text {
                        text: name
                        color: "white"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }

    // Settings options
    ListModel {
        id: settingsModel
        ListElement { name: "Rinse"; icon: "qrc:/images/bubbles.png" }
        ListElement { name: "Shut Down"; icon: "qrc:/images/on-off-button.png" }

    }

    // Back button
    Image {
        id: backButton
        y: 40
        source: "qrc:/images/icon-back.png"
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 57
        anchors.bottomMargin: 401
        transform: Scale { id: zoomScale1; xScale: 1; yScale: 1; origin.x: backButton.width / 2; origin.y: backButton.height / 2 }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                zoomScale1.xScale = 1.1
                zoomScale1.yScale = 1.1
            }

            onExited: {
                zoomScale1.xScale = 1.0
                zoomScale1.yScale = 1.0
            }
            onClicked: {
                stackView.pop()
            }
        }
    }
}
