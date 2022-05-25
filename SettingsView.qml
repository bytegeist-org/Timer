import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts

Item {
    id: root

    Rectangle{
        id:timeRemaining
        color: Constants.accentColor1 //TODO: remove and change to Item

        anchors.fill: parent
//        anchors.centerIn: parent


//        height: parent.height * 0.8
//        width: parent.width * 0.8


        GridLayout {
            id: grid

            anchors.fill: parent
            anchors.margins: 20

            columns: 3

            // Row 1
            Text {
                text: "Settings"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                color: Constants.textColor

                Layout.columnSpan: 3
                Layout.fillWidth: true
            }

            //Row 2
            Text {
                text: "Set time manual"
                color: Constants.textColor

                Layout.fillWidth: true
            }
            SpinBox {
                id: spinboxMinutes
                from: 0
                value: 60
                to: 120
                stepSize: 1
                editable: true

                Layout.fillWidth: true
            }
            Button {
                id: saveButton
                text: "Ok"

                Layout.fillWidth: true

                onClicked: {
                    mainTimerView.timerStartValue_s = spinboxMinutes.value * 60
                    //mainTimerView.secondsRemaining = 0
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }

            // Row 3

            Button {
                text: "60:00"

                Layout.fillWidth: true
                Layout.preferredWidth: parent.width * 0.33

                onClicked: {
                    mainTimerView.timerStartValue_s = 60 * 60
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }
            Button {
                text: "30:00"

                Layout.fillWidth: true
                Layout.preferredWidth: parent.width * 0.33

                onClicked: {
                    mainTimerView.timerStartValue_s = 30 * 60
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }
            Button {
                text: "15:00"

                Layout.fillWidth: true
                Layout.preferredWidth: parent.width * 0.33

                onClicked: {
                    mainTimerView.timerStartValue_s = 15 * 60
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }

            Button {
                text: "Close"

                Layout.fillWidth: true
                Layout.row: 3
                Layout.column: 2

                onClicked: {
                    settingsView.visible = false
                }
            }
            Text{
                text: "V0.0.1"
                font.pointSize: 6
                color: Constants.textColor

                Layout.fillWidth: true

                Layout.row: 4
                Layout.column: 0

                horizontalAlignment: Text.Alignleft
            }
            Text{
                text: "https://github.com/bytegeist-org/Timer"
                font.pointSize: 6
                color: Constants.textColor

                Layout.fillWidth: true

                Layout.row: 4
                Layout.column: 2

                horizontalAlignment: Text.AlignRight
            }
        }



//        Text{
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top

//            text: "Settings"

//            color: Constants.textColor
//            font.pixelSize: 14
//        }

//        SpinBox {
//            id: spinboxMinutes
//            from: 0
//            value: 60
//            to: 120
//            stepSize: 1
//            editable: true

//            anchors.centerIn: parent
//        }

//        Button {
//            id: saveButton
//            text: "Ok"
//            onClicked: {
//                mainTimerView.timerStartValue_s = spinboxMinutes.value * 60
//                settingsView.visible = false
//            }
//        }

    }


}
