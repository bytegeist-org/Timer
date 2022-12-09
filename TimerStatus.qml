import QtQuick 2.0
//import QtGraphicalEffects 1.12

Item {
    id: root

    property int minutesRemaining: 255
    property int secondsRemaining: 60
    property bool timerRunning: false
    property bool openSettings: false

    Item{
        id:timerIcon

        //color: "steelblue" //TODO: remove and change to Item

        width: parent.width
        height: parent.height/3

        anchors.top: parent.top

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.timerRunning = !timerRunning;
                console.log("timerRunning set to :" + String(timerRunning))

            }
        }

        Image{
            id: iconImage
            //play pause icon
            width: parent.width - 10
            height: parent.height - 10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            //source: "qrc:/images/play.svg"
            source: {
                if(timerRunning === true){
                    return "qrc:/images/pause_nord.svg"
                } else {
                    return "qrc:/images/play_nord.svg"
                }
            }

            sourceSize.width: 500
            sourceSize.height: 500


            fillMode: Image.PreserveAspectFit
        }

//        ColorOverlay{
//                anchors.fill: iconImage
//                source:iconImage
//                color: {
//                    if (timerRunning === true &&  minutesRemaining === 0 && secondsRemaining === 0){
//                        return Constants.textColorWarning
//                    } else {
//                        return Constants.textColor
//                    }
//                }
//                //transform:rotation
//                //antialiasing: true
//            }

    }

    Item{
        id:timeRemaining
        //color: "#099956" //TODO: remove and change to Item

        width: parent.width
        height: parent.height/3

        anchors.top: timerIcon.bottom

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (timerRunning === false || (timerRunning === true &&  minutesRemaining === 0 && secondsRemaining === 0)){
                    openSettings = true;
                    timerRunning = false;
                    console.log("open Settings")
                }
            }
        }

        Text{
            color: {
                if (timerRunning === true &&  minutesRemaining === 0 && secondsRemaining === 0){
                    return Constants.textColorWarning
                } else {
                    return Constants.textColor
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            //anchors.bottom: parent.bottom

            text: String(minutesRemaining).padStart(2, '0') + ":" + String(secondsRemaining).padStart(2, '0')
            font.bold: true
            font.pixelSize: parent.height * 0.75

        }

    }

    Item{
        id: currentTime
        //color: "#711156"  //TODO: remove and change to Item

        width: parent.width
        height: parent.height/3

        anchors.bottom: parent.bottom

        Text{
            id: currentTimeText
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top: parent.top
            anchors.verticalCenter: parent.verticalCenter

            text: getCurrentTime()
            color: {
                if (timerRunning === true &&  minutesRemaining === 0 && secondsRemaining === 0){
                    return Constants.textColorWarning
                } else {
                    return Constants.textColor
                }
            }

            font.pixelSize: parent.height * 0.35

            function getCurrentTime(){
                var today = new Date();
                var UTCcorrection = +2;
                //currentTimeText.text = String(today.getHours()).padStart(2, '0') + ":" + String(today.getMinutes()).padStart(2, '0') + ":" + String(today.getSeconds()).padStart(2, '0');
                currentTimeText.text = "current time: " + String(today.getUTCHours()+ UTCcorrection).padStart(2, '0') + ":" + String(today.getUTCMinutes()).padStart(2, '0');
            }
        }
        Timer {
            id: textTimer
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: currentTimeText.getCurrentTime()
        }
    }

}
