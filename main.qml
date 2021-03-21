import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root

    property bool alwaysOnTop: false    //not jet functional

    width: 640
    height: 480
    visible: true
    title: qsTr("Timer")

    onAlwaysOnTopChanged: { //https://stackoverflow.com/questions/57094057/qml-toggle-window-flags
                        if(true)
                            root.flags = root.flags | Qt.WindowStaysOnTopHint
                        else
                            root.flags = root.flags & ~Qt.WindowStaysOnTopHint
                    }


    Item {
        id: mainGauge

        property int minutesRemaining: 35
        property int secondsRemaining: 48
        property int pctRemaining: 15

        anchors.centerIn: parent
        anchors.fill: parent




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

        TimerText{
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

            width:  (parent.height >= parent.width) ? parent.width * 0.1 : parent.height * 0.1
            height: (parent.height >= parent.width) ? parent.width * 0.1 : parent.height * 0.1

        }


    }

}
