import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.5
import QtMultimedia 5.5

Item {
    id: brewPage
    width:640
    height:480
    property url espressoVideo: "qrc:/videos/espresso_video.mp4"
    property url latteVideo: "qrc:/videos/latte_video.mp4"
    property url americanoVideo: "qrc:/videos/americano_video.mp4"
    property url cappuccinoVideo: "qrc:/videos/cappucino_video.mp4"
    property string coffeeType: ""

    MediaPlayer {
                id: player
                source:""
                autoPlay: true
                loops: 1
                onStopped:{
                    if (coffeeType === "LATTE" || coffeeType === "CAPPUCCINO") {
                        milkDialog.visible = true; // Show popup for milk-based coffee
                    } else {
                        stackView.push("qrc:/Rinse.qml", { stackView: stackView });
                    }
                }
            }
            VideoOutput {
                width:640
                height:480
                id: videoOutput
                source: player
                anchors.centerIn: parent
                focus: true
            }

            function playCoffeeVideo(type) {
                if (type === "ESPRESSO") {
                    player.source = espressoVideo;
                } else if (type === "LATTE") {
                    player.source = latteVideo;
                } else if (type === "AMERICANO") {
                    player.source = americanoVideo;
                } else if (type === "CAPPUCINO"){
                    player.source = cappuccinoVideo;
                } else {
                    return;  // Exit function if coffee type is invalid
                }
                console.log("Playing video for: " + type + " | Source: " + player.source);
                player.play();
            }

            onCoffeeTypeChanged: {
                playCoffeeVideo(coffeeType)
            }

            Rectangle {
                id: milkDialog
                visible: false
                width: 300
                height: 200
                color: "white"
                radius: 10
                border.color: "black"
                anchors.centerIn: parent
                z: 100  // Ensures it appears on top

                MouseArea {
                    anchors.fill: parent
                    onClicked: {}  // Prevents clicks from passing through
                }

                Column {
                    spacing: 20
                    anchors.centerIn: parent

                    Text {
                        text: "Do you want to clean the milk system?"
                        font.pixelSize: 16
                        color: "black"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Row {
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Button {
                            text: "Yes"
                            onClicked: {
                                milkDialog.visible = false;
                                stackView.push("qrc:/CleanAll.qml", { stackView: stackView });
                            }
                        }

                        Button {
                            text: "No"
                            onClicked: {
                                milkDialog.visible = false;
                                stackView.push("qrc:/Rinse.qml", { stackView: stackView });
                            }
                        }
                    }
                }
            }

}
