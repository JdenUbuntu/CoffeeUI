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
            id: item1
            Image {
                id: espresso
                x: 200
                y: 133
                height: 240
                width: 240
                source: "qrc:/images/americano.png"
                transform: Scale { id: zoomScale; xScale: 1; yScale: 1; origin.x: espresso.width / 2; origin.y: espresso.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomScale.xScale = 1.1
                        zoomScale.yScale = 1.1
                    }

                    onExited: {
                        zoomScale.xScale = 1.0
                        zoomScale.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "espresso" })
                    }
                }
            }

            Text {
                id: text1
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
            id: item4
            Image {
                id: americano
                x: 200
                y: 133
                height: 240
                width: 240
                source: "qrc:/images/espresso.png"
                transform: Scale { id: zoomScale3; xScale: 1; yScale: 1; origin.x: americano.width / 2; origin.y: americano.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomScale3.xScale = 1.1
                        zoomScale3.yScale = 1.1
                    }

                    onExited: {
                        zoomScale3.xScale = 1.0
                        zoomScale3.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "americano" })
                    }
                }
            }

            Text {
                id: text4
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

        Item {
            id: item2
            Image {
                id: latte
                x: 200
                y: 134
                height: 240
                width:240
                source: "qrc:/images/latte.png"
                transform: Scale { id: zoomScale1; xScale: 1; yScale: 1; origin.x: latte.width / 2; origin.y: latte.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomScale1.xScale = 1.1
                        zoomScale1.yScale = 1.1
                    }

                    onExited: {
                        zoomScale1.xScale = 1.0
                        zoomScale1.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "latte" })
                }
              }
            }

            Text {
                id: text2
                text: qsTr("LATTE")
                color: "white"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.family: "Verdana"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:parent.top
                anchors.topMargin: 40
            }
        }

        Item {
            id: item3
            Image {
                id: cappucino
                x: 200
                y: 133
                height: 240
                width: 240
                source: "qrc:/images/cappuccino.png"
                transform: Scale { id: zoomScale2; xScale: 1; yScale: 1; origin.x: cappucino.width / 2; origin.y: cappucino.height / 2 }

                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        zoomScale2.xScale = 1.1
                        zoomScale2.yScale = 1.1
                    }

                    onExited: {
                        zoomScale2.xScale = 1.0
                        zoomScale2.yScale = 1.0
                    }
                    onClicked:{
                        stackView.push("qrc:/BrewSelection.qml", { coffeeType: "cappuccino" })
                    }
                }
            }

            Text {
                id: text3
                text: qsTr("CAPPUCCINO")
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
            transform: Scale { id: zoomScale_1; xScale: 1; yScale: 1; origin.x: settings.width / 2; origin.y: settings.height / 2 }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    zoomScale_1.xScale = 1.1
                    zoomScale_1.yScale = 1.1
                }

                onExited: {
                    zoomScale_1.xScale = 1.0
                    zoomScale_1.yScale = 1.0
                }
                onClicked: stackView.push("qrc:/Settings.qml")
            }
        }

}
