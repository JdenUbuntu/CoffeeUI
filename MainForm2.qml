import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.5

Item {
    id: root
    width: 640
    height: 480
    signal selectionComplete(string coffeeType)
    property string coffeeType: ""
    property bool leftSlot: false
    property bool rightSlot: false
    property int cupHeight: 0

    SwipeView {
        id: coffeeSwipe
        anchors.fill: parent
        interactive: false  // can be set false to block swipe until ready
        clip: true

        Item {
            id: item_1
            Image {
                id: espresso
                x: 200
                y: 133
                height: 240
                width: 240
                source: "qrc:/images/americano.png"
                transform: Scale { id: zoomscale; xScale: 1; yScale: 1; origin.x: espresso.width / 2; origin.y: espresso.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomscale.xScale = 1.1
                        zoomscale.yScale = 1.1
                    }

                    onExited: {
                        zoomscale.xScale = 1.0
                        zoomscale.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "ESPRESSO" })
                    }
                }
            }

            Text {
                id: text_1
                text: qsTr("ESPRESSO")
                color: "white"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.family: "Verdana"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 40
            }
        }

        Item {
            id: item_4
            Image {
                id: americano
                x: 200
                y: 133
                height: 240
                width: 240
                source: "qrc:/images/espresso.png"
                transform: Scale { id: zoomscale3; xScale: 1; yScale: 1; origin.x: americano.width / 2; origin.y: americano.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomscale3.xScale = 1.1
                        zoomscale3.yScale = 1.1
                    }

                    onExited: {
                        zoomscale3.xScale = 1.0
                        zoomscale3.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "AMERICANO" })
                    }
                }
            }

            Text {
                id: text_4
                text: qsTr("AMERICANO")
                color: "white"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.family: "Verdana"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 40
            }
        }

    }



    Image {
            id: nextButton
            x: 508
            y: 215
            height: 50
            width: 50
            anchors.right:parent.right
            anchors.verticalCenter: parent
            source: "qrc:/images/icon-go.png"
            anchors.rightMargin: 82
            transform: Scale { id: zoomScale4; xScale: 1; yScale: 1; origin.x: nextButton.width / 2; origin.y: nextButton.height / 2 }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    zoomScale4.xScale = 1.1
                    zoomScale4.yScale = 1.1
                }

                onExited: {
                    zoomScale4.xScale = 1.0
                    zoomScale4.yScale = 1.0
                }

                onClicked: {
                    if (coffeeSwipe.currentIndex < coffeeSwipe.count - 1)
                        coffeeSwipe.currentIndex += 1
                }
            }
        }

        Image {
            id: backButton
            y: 215
            height: 50
            width: 50
            anchors.left:parent.left
            anchors.verticalCenter: parent
            source: "qrc:/images/icon-back.png"
            anchors.leftMargin: 67
            transform: Scale { id: zoomScale5; xScale: 1; yScale: 1; origin.x: backButton.width / 2; origin.y: backButton.height / 2 }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    zoomScale5.xScale = 1.1
                    zoomScale5.yScale = 1.1
                }

                onExited: {
                    zoomScale5.xScale = 1.0
                    zoomScale5.yScale = 1.0
        }
                onClicked: {
                    if (coffeeSwipe.currentIndex > 0)
                        coffeeSwipe.currentIndex -= 1
                }
            }
        }

        Image {
            id: settings
            x: 550
            y: 51
            source: "qrc:/images/settings-button.png"
            height: 30
            width: 30
            visible: true
            transform: Scale { id: zoomScale1; xScale: 1; yScale: 1; origin.x: settings.width / 2; origin.y: settings.height / 2 }

            MouseArea{
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
                onClicked: stackView.push("qrc:/Settings.qml")
            }
        }

}
