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
            columns: 4

            // Row 0
            Text {
                text: "Settings"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                color: Constants.textColor

                Layout.columnSpan: 4
                Layout.fillWidth: true
            }

            //Row 1
            Text {
                text: "Set time manual"
                color: Constants.textColor

                Layout.fillWidth: true
                Layout.columnSpan: 2
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

            // Row 2
            Text {
                text: "Presets"
                color: Constants.textColor

                Layout.fillWidth: true
            }
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

            // Row 3
            Text {
                text: "Smart Preset"
                color: Constants.textColor

                Layout.fillWidth: true
                Layout.columnSpan: 2
            }
            Button {
                id: fullHourButton

                function getMinutesToFullHour(){
                    var today = new Date();
                    //console.log("minutes to full hour: " + String(60 - today.getUTCMinutes()))
                    return 60 - today.getUTCMinutes();
                }

                text: "next full hour"
                Layout.fillWidth: true
                onClicked: {
                    mainTimerView.timerStartValue_s = getMinutesToFullHour() * 60
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }
            Button {
                id: halfHourButton

                function getMinutesToHalfHour(){
                    var today = new Date();
                    var currentMinutes = today.getUTCMinutes();
                    //console.log("minutes to half hour: " + String(currentMinutes))

                    if(currentMinutes >= 30){
                        return 60 - currentMinutes;
                    }else{
                        return 30 - currentMinutes;
                    }
                }

                text: "next half hour"
                Layout.fillWidth: true
                onClicked: {
                    mainTimerView.timerStartValue_s = getMinutesToHalfHour() * 60
                    mainTimerView.timerRunningValue_s = 0
                    settingsView.visible = false
                }
            }

            // Row 4
            Button {
                text: "Close"
                Layout.fillWidth: true
                Layout.row: 4
                Layout.column: 3
                onClicked: {
                    settingsView.visible = false
                }
            }

            // Row 5
            Text{
                property string versionName: getVersionString()

                function getVersionString(){
                    var today = new Date();
                    var versionString = "Version: " + String(today.getTime());

                    console.log(versionString);

                    return versionString
                }

                text: versionName
                font.pointSize: 6
                color: Constants.textColor
                Layout.fillWidth: true
                Layout.row: 5
                Layout.column: 0
                horizontalAlignment: Text.Alignleft
            }
            Text{
                text: "https://github.com/bytegeist-org/Timer"
                font.pointSize: 6
                color: Constants.textColor
                Layout.fillWidth: true
                Layout.row: 5
                Layout.column: 3
                horizontalAlignment: Text.AlignRight
            }
        }
    }
}
