import QtQuick 2.0

Item {
    id: root

    property int minutesRemaining: 35
    property int secondsRemaining: 48
    property int pctRemaining: 9

    ProgressCircle {
        id: circleIndicator

        property int timeRemainingPct: parent.pctRemaining

        onTimeRemainingPctChanged: console.log("value changed!");

        anchors.centerIn: parent

        size: (parent.height >= parent.width) ? parent.width * 0.9 : parent.height * 0.9
        lineWidth: this.size * 0.2

        colorCircle: getColor(timeRemainingPct)
        colorBackground: "lightgray"

        showBackground: true
        arcBegin: (360/100) * (100-timeRemainingPct);  // value changes from 0 = 100% remaining to 360 = 0% remaining
        arcEnd: 360 //value is constant

        function getColor(pctRemaining){

            var color = "dimgray"

            if (pctRemaining > 25 ){
                color = "dimgray"
            } else if (pctRemaining > 10){
                color = "darkorange"
            }else{
                color = "red"
            }

            return color;
        }

    }

    TimerStatus{
        id: mainText

        minutesRemaining: parent.minutesRemaining
        secondsRemaining: parent.secondsRemaining

        anchors.centerIn: parent

        width: circleIndicator.size * 0.4
        height: circleIndicator.size * 0.4

    }

    Rectangle{
        id: settingsIcon
        color: "#e28c8c"

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        width:  (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15
        height: (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15

    }

    Rectangle{
        id: xxIcon
        color: "#e28c8c"

        anchors.left: parent.left
        anchors.bottom: parent.bottom

        width:  (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15
        height: (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15

    }

}
