import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: item1
    width: 640
    height: 480

    // Display text
    Text {
        id: text1
        x: 249
        y: 107
        color: "white"
        visible: true
        text: qsTr("Rinsing...")
        font.pixelSize: 30
        font.family: "Verdana"
        anchors.bottom: bubbles.top
        anchors.bottomMargin: 35
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
                    progressBarAnim1.running = false
                    bubbles.visible = false

                    milkDialog.visible = true
                }
            }
        }
    }

    Rectangle {
        id: milkDialog
        visible: false
        width: 400
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
                text: "Please Set Up The Milk System For Cleaning"
                font.pixelSize: 16
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Ready"
                    onClicked: {
                        milkDialog.visible = false;
                        text123.visible = true
                        milk.visible = true
                        progress.visible = true
                        progressBar.visible = true
                        progressBarAnim.running = true
                    }
                }

                Button {
                    text: "Cancel"
                    onClicked: {
                        milkDialog.visible = false;
                    }
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
        id: text123
        x: 142
        y: 107
        visible: false
        text: qsTr("Cleaning Milk System...")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        color: "white"
        anchors.bottom: milk.top
        anchors.bottomMargin: 47
    }

    Rectangle {
        id:progress
        visible: false
        width: 300
        height: 20
        color: "#444"  // Background color
        radius: 5
        anchors.verticalCenterOffset: 99
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent

        // Progress bar inside the container
        Rectangle {
            id: progressBar
            width: 0  // Starts at 0 width
            height: parent.height
            color: "white"  // Progress color
            radius: 5

            // Animate width to 300 (full width) over 5 seconds
            NumberAnimation on width {
                id:progressBarAnim
                running: false
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
        id: milk
        visible: false
        x: 270
        y: 190
        width: 100
        height: 100
        source: "qrc:/images/milk.png"
        fillMode: Image.PreserveAspectFit
    }
}
