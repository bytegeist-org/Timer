import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: root

    Rectangle{
        id:timeRemaining
        color: "black" //TODO: remove and change to Item

        anchors.fill: parent
//        anchors.centerIn: parent


//        height: parent.height * 0.8
//        width: parent.width * 0.8
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            text: "Settings"

            color: Constants.textColor
            font.pixelSize: 14
        }

        SpinBox {
            id: spinboxMinutes
            from: 0
            value: 60
            to: 120
            stepSize: 1
            editable: true

            anchors.centerIn: parent
        }

        Button {
            id: saveButton
            text: "Ok"
            onClicked: {
                mainTimerView.timerStartValue_s = spinboxMinutes.value * 60
                settingsView.visible = false
            }
        }

    }


}
