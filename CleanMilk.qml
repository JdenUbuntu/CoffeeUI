import QtQuick 2.0
import QtQuick.Controls 1.5
import QtMultimedia 5.5

Item {
    width: 640
    height: 480

    Rectangle {
        id: milkDialog
        visible: true
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
                        text1.visible = true
                        milk.visible = true
                        progress1.visible = true
                        progressBar1.visible = true
                        progressBarAnim1.running = true
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

    Text {
        id: text1
        visible: false
        x: 142
        y: 103
        text: qsTr("Cleaning Milk System...")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        color: "white"
        anchors.top: parent
        anchors.topMargin: 40
    }

    Rectangle {
        id:progress1
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
            id: progressBar1
            visible: false
            width: 0  // Starts at 0 width
            height: parent.height
            color: "white"  // Progress color
            radius: 5

            // Animate width to 300 (full width) over 5 seconds
            NumberAnimation on width {
                id:progressBarAnim1
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
                visible:false
                x: 270
                y: 190
                width: 100
                height: 100
                source: "qrc:/images/milk.png"
                fillMode: Image.PreserveAspectFit
            }
}

