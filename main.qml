import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.5

ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    color: "black"
    property string selectedCoffeeType: ""

    Loader{
        id:mainLoader
        anchors.fill: parent
        source: "StackViewPage.qml"
    }

}
