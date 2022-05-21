import QtQuick 2.0

Rectangle {
    id: root

    color: Constants.backgroundColor

    // timer values
    //property bool timerRunning: false
    property alias timerRunning: mainText.timerRunnung
    property int timerStartValue_s: 50 //in secondes
    property int timerRunningValue_s: 0 // in seconds


    function getMinutesRemaining(startValue, runningValue){

        var minutesLeft = 0

        if ( runningValue < startValue){
            minutesLeft = (startValue - runningValue) / 60;
        }else{
            minutesLeft = 0;
        }
        return minutesLeft;
    }

    function getSecondsRemaining(startValue, runningValue){

        var secondsLeft = 0

        if ( runningValue < startValue){
            secondsLeft = (startValue - runningValue) % 60;
        }else{
            secondsLeft = 0;
        }
        return secondsLeft;
    }

    function getPercentRemaining(startValue, runningValue){

        var percentLeft = 0

        if ( startValue === 0 ){
            percentLeft = 100;
        } else if ( runningValue < startValue){
            percentLeft = (1 - (runningValue / startValue)) * 100;
        }else{
            percentLeft = 0;
        }
        return percentLeft;
    }

    function checkTimer(timerRunning, runningValue){
        console.log("checktimer called, timerRunning: " + String(timerRunning) + " RunningValue: " + String(runningValue))

        var returnValue = 0;

        if (timerRunning === true ){
                returnValue = runningValue + 1;
        }
        else{
            returnValue = runningValue;
        }
        //console.log("retunrnvalue " + String(returnValue))
        return returnValue
    }

    Timer {
        id: countdownTimer
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            root.timerRunningValue_s = checkTimer(timerRunning, timerRunningValue_s);
            console.log("timerRunningValue_s: " + String(root.timerRunningValue_s));
            if (root.timerRunningValue_s >= root.timerStartValue_s){
                running = false;
            }
        }
    }

    // those value will be displayed
    property int minutesRemaining: getMinutesRemaining(timerStartValue_s, timerRunningValue_s)
    property int secondsRemaining: getSecondsRemaining(timerStartValue_s, timerRunningValue_s)
    property int pctRemaining: getPercentRemaining(timerStartValue_s, timerRunningValue_s)


    ProgressCircle {
        id: circleIndicator

        property int timeRemainingPct: parent.pctRemaining

        onTimeRemainingPctChanged: console.log("value changed!");

        anchors.centerIn: parent

        size: (parent.height >= parent.width) ? parent.width * 0.9 : parent.height * 0.9
        lineWidth: this.size * 0.2

        colorCircle: getColor(timeRemainingPct)
        colorBackground: Constants.ringColorBackground

        showBackground: true
        arcBegin: (360/100) * (100-timeRemainingPct);  // value changes from 0 = 100% remaining to 360 = 0% remaining
        arcEnd: 360 //value is constant

        function getColor(pctRemaining){

            var color = Constants.ringColorNormal

            if (pctRemaining > 25 ){
                color = Constants.ringColorNormal
            } else if (pctRemaining > 10){
                color = Constants.ringColorInfo
            }else{
                color = Constants.ringColorWarning
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

//    Rectangle{
//        id: settingsIcon
//        color: Constants.accentColor1

//        anchors.right: parent.right
//        anchors.bottom: parent.bottom

//        width:  (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15
//        height: (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15

//    }

//    Rectangle{
//        id: xxIcon
//        color: Constants.accentColor1

//        anchors.left: parent.left
//        anchors.bottom: parent.bottom

//        width:  (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15
//        height: (parent.height >= parent.width) ? parent.width * 0.15 : parent.height * 0.15

//        Image{
//            source: "qrc:/images/play.png"
//        }

//    }

}
