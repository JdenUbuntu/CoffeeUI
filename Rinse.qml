import QtQuick 2.0
import QtQuick.Controls 1.5
import QtMultimedia 5.5

Item {
    width: 640
    height: 480

    Text {
        id: text1
        x: 249
        y: 94
        text: qsTr("Rinsing...")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        color: "white"
        anchors.top: parent
        anchors.topMargin: 40
    }

    Rectangle {
        id:progress1
        visible: true
        width: 300
        height: 20
        color: "#444"  // Background color
        radius: 5
        anchors.verticalCenterOffset: 99
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent

        // Progress bar inside the container
        Rectangle {
            id: progressBar1
            width: 0  // Starts at 0 width
            height: parent.height
            color: "white"  // Progress color
            radius: 5

            // Animate width to 300 (full width) over 5 seconds
            NumberAnimation on width {
                id:progressBarAnim1
                from: 0
                to: 300
                duration: 5000  // Duration of progress
                loops: 1
                onStopped: {
                    stackView.push("qrc:/StackViewPage.qml",{stackView:stackView})
                }

            }
        }
    }

            Image {
                id: bubbles
                x: 270
                y: 190
                width: 100
                height: 100
                source: "images/bubbles.png"
                fillMode: Image.PreserveAspectFit
            }

}
