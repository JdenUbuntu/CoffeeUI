import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    width: 640
    height: 480

    property bool isLeftSlot: false
    property bool isRightSlot: false
    property int cupHeight: 0  // Stores cup height (in mm)
    signal cupDetected(bool left, bool right, int height)


    Timer {
        id: heightTimer
        interval: 3000 // Simulate delay
        running: true
        repeat: true
        onTriggered: {
            isLeftSlot = true // Simulating a cup detected in left slot
            cupHeight = 120 // Simulating cup height (in mm)
            cupDetected(isLeftSlot, isRightSlot, cupHeight)
            if (isLeftSlot === true) {  // Example condition
                heightTimer.stop()
                stackView.push("qrc:/MainForm.qml")
            } else {
                heightTimer.stop()
                stackView.push("qrc:/MainForm2.qml")
            }

        }
    }

    Text {
        id: text1
        x: 218
        y: 8
        text: qsTr("COFFEE")
        font.pixelSize: 40
        anchors.verticalCenterOffset: -95
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        color: "white"
        anchors.centerIn: parent
    }

    Text {
        id: text2
        x: 297
        y: 8
        text: qsTr("EYE")
        font.pixelSize: 25
        font.family: "Verdana"
        color: "white"
        anchors.top: text1.bottom
        anchors.topMargin: 6
    }

}
