import QtQuick 2.0
import QtQuick.Controls 1.5

Item {
    anchors.fill: parent
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: HeightDetection{}

        property string selectedCoffeeType: ""
    }

}
