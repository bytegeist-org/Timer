import QtQuick 2.0

Item {
    id: root

    property int minutesRemaining: 255
    property int secondsRemaining: 60
    property bool timerRunnung: false

    Item{
        id:timerIcon

        //color: "steelblue" //TODO: remove and change to Item

        width: parent.width
        height: parent.height/3

        anchors.top: parent.top

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.timerRunnung = !timerRunnung;
                console.log("timerRunning set to :" + String(timerRunnung))
            }
        }

        Image{
            id: iconImage
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

            sourceSize.width: 50
            sourceSize.height: 50


            fillMode: Image.PreserveAspectFit
        }

    }

    Item{
        id:timeRemaining
        //color: "#099956" //TODO: remove and change to Item

        width: parent.width
        height: parent.height/3

        anchors.top: timerIcon.bottom

        Text{
            color: {
                if (timerRunnung === true &&  minutesRemaining === 0 && secondsRemaining === 0){
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
            color: Constants.textColor

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
