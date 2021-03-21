import QtQuick 2.0

Item {
    id: mainTimerText

    property int minutesRemaining: 255
    property int secondsRemaining: 60

    Rectangle{
        id:timeRemaining
        //color: "#099956" //TODO: remove and change to Item

        width: parent.width
        height: parent.height/2

        anchors.top: parent.top

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            text: String(minutesRemaining).padStart(2, '0') + ":" + String(secondsRemaining).padStart(2, '0')
            font.pixelSize: parent.height * 0.65
        }

    }
    Rectangle{
        id: currentTime
        //color: "#711156"  //TODO: remove and change to Item

        width: parent.width
        height: parent.height/2

        anchors.bottom: parent.bottom

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            text: getCurrentTime()
            font.pixelSize: parent.height * 0.35

            function getCurrentTime(){
                var today = new Date();
                return String(today.getHours()).padStart(2, '0') + ":" + String(today.getMinutes()).padStart(2, '0') + ":" + String(today.getSeconds()).padStart(2, '0');
            }
        }
    }

}
