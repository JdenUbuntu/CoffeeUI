import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.5
import QtMultimedia 5.5

Item {
    id: brewPage
    width:640
    height:480
    property url espressoVideo: "qrc:/videos/espresso_video.avi"
    property url latteVideo: "qrc:/videos/latte_video.avi"
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

            onCoffeeTypeChanged: {
                console.log("Brew Page Loaded with Coffee Type: " + coffeeType)
                player.source = (coffeeType === "espresso") ? espressoVideo : latteVideo
                console.log("Video Source Set to: " + player.source)
                player.play()
            }

}
