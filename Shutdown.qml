import QtQuick 2.0
import QtQuick.Controls 1.5
import QtMultimedia 5.5

Item {
    id: item1
    width: 640
    height: 480

    // Display text
    Text {
        id: text1
        x: 250
        y: 106
        text: qsTr("Rinsing...")
        font.pixelSize: 30
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
        anchors.verticalCenterOffset: 76
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
                    text1.visible = false
                    progress1.visible = false
                    progressBar1.visible = false
                    progressBarAnim.running = false
                    bubbles.visible = false

                    loadingText.visible = true
                    shutdownIcon.visible = true
                    progress.visible = true
                    progressBar.visible = true
                    progressBarAnim.start()
                }
            }
        }
    }

            Image {
                id: bubbles
                x: 270
                y: 178
                width: 100
                height: 100
                source: "images/bubbles.png"
                fillMode: Image.PreserveAspectFit
            }

    Text {
        id: loadingText
        width: 320
        height: 48
        text: qsTr("Shutting down...")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        font.family: "Verdana"
        color: "white"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 100
        visible: false  // Show only when shutdown starts
    }

    Image {
        id: shutdownIcon
        source: "qrc:/images/on-off-button.png"
        anchors.verticalCenterOffset: -12
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        width: 100
        height: 100
        visible: false
    }

    Rectangle {
        id:progress
        visible: false
        width: 300
        height: 20
        color: "#444"  // Background color
        radius: 5
        anchors.verticalCenterOffset: 76
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent

        // Progress bar inside the container
        Rectangle {
            id: progressBar
            visible: false
            width: 0  // Starts at 0 width
            height: parent.height
            color: "white"  // Progress color
            radius: 5

            // Animate width to 300 (full width) over 5 seconds
            NumberAnimation on width {
                id:progressBarAnim
                from: 0
                to: 300
                duration: 5000  // Duration of progress
                loops: 1
                running: false
                onStopped: {
                    Qt.quit()
                }
            }
        }
    }

}
