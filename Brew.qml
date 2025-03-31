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
                    stackView.push("qrc:/MainForm.qml", { stackView: stackView })
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
                if (type === "espresso") {
                    player.source = espressoVideo;
                } else if (type === "latte") {
                    player.source = latteVideo;
                } else if (type === "americano") {
                    player.source = americanoVideo;
                } else if (type === "cappucino"){
                    player.source = cappuccinoVideo;
                } else {
                    console.log("Invalid coffee type: " + type);
                    return;  // Exit function if coffee type is invalid
                }
                console.log("Playing video for: " + type + " | Source: " + player.source);
                player.play();
            }

            onCoffeeTypeChanged: {
                playCoffeeVideo(coffeeType)
            }

}
