import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    id: root
    width: 640
    height: 480
    signal brewSelectionComplete()
    signal brewSelectionCancel()
    property string coffeeType: ""
    property int coffeeStrength: 3  // Strength level: 0 - 7
    signal strengthSelected(int level)


    Image {
        id: emptyCup
        source: "qrc:/images/empty_shot_glass-removebg-preview.png"
        anchors.rightMargin: 347
        anchors.topMargin: 96
        anchors.bottomMargin: 96
        anchors.leftMargin: 8
        sourceSize.height: 300
        sourceSize.width: 300
        anchors.fill:parent
    }

    Button{
        id: brewButton
        x: 481
        y: 432
        width: 151
        height: 40
        text: "BREW!"
        onClicked: stackView.push("qrc:/Brew.qml", { coffeeType: coffeeType })

    }

    Button{
        id: cancelButton
        x: 8
        y: 432
        width: 151
        height: 40
        text: "CANCEL"
        onClicked: stackView.pop()

    }

    Row
    {
        x: 209
        y: 390
        spacing: 8
        anchors.verticalCenterOffset: -168
        anchors.horizontalCenterOffset: 1
        anchors.bottomMargin: 12

        Repeater {
            id: coffeeRepeater
            model: 7  // 7 beans to select from

            Image {
                id: beanImage
                source: index < coffeeStrength
                        ? "qrc:/images/coffee.png"
                        : "qrc:/images/no_coffee.png"
                width: 25
                height: 25
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.coffeeStrength = index + 1  // Strength from 1 to 7
                        root.strengthSelected(root.coffeeStrength)
                    }
                }
            }
        }
    }

        SwipeView{
            id:volumeSwipe
            y: 215
            anchors {
                left: emptyCup.right
                horizontalCenter: parent.horizontalCenter
                topMargin: -174
            }
            width: parent.width * 0.4
            height: 50
            anchors.horizontalCenterOffset: 116
            anchors.leftMargin: 116
            interactive: false
            clip: true
            currentIndex: 0

            Item {
                id: minimum
                width: volumeSwipe.width
                height: volumeSwipe.height
                Text {
                    id: text1
                    x: 106
                    y: 0
                    width: 54
                    height: 50
                    text: qsTr("40ml")
                    color: "white"
                    font.pixelSize: 25
                    anchors.centerIn: parent
                }

            }

            Item {
                id: medium
                width: volumeSwipe.width
                height: volumeSwipe.height

                Text {
                    id: text2
                    x: 106
                    y: 0
                    width: 54
                    height: 50
                    text: qsTr("60ml")
                    color: "white"
                    font.pixelSize: 25
                    anchors.centerIn: parent
                }
            }

            Item {
                id: maximum
                width: volumeSwipe.width
                height: volumeSwipe.height

                Text {
                    id: text3
                    x: 106
                    y: 0
                    width: 54
                    height: 50
                    text: qsTr("80ml")
                    color: "white"
                    font.pixelSize: 25
                    anchors.centerIn: parent
                }
            }

        }

        Image {
            x: 532
            source: "qrc:/images/right.png"
            anchors.verticalCenterOffset: 0
            height: 50
            width: 50
            anchors.verticalCenter: volumeSwipe.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (volumeSwipe.currentIndex < volumeSwipe.count - 1)
                        volumeSwipe.currentIndex += 1
                }
            }
        }

        Image{
            x: 299
            source: "qrc:/images/left.png"
            height: 50
            width: 50
            anchors.verticalCenter: volumeSwipe.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (volumeSwipe.currentIndex > 0)
                        volumeSwipe.currentIndex -= 1
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
