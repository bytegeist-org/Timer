import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root

    property bool alwaysOnTop: false    //not jet functional

    width: 500
    height: 500
    visible: true
    title: qsTr("Timer")

//    onAlwaysOnTopChanged: { //https://stackoverflow.com/questions/57094057/qml-toggle-window-flags
//                        if(true)
//                            root.flags = root.flags | Qt.WindowStaysOnTopHint
//                        else
//                            root.flags = root.flags & ~Qt.WindowStaysOnTopHint
//                    }

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        TimerView {
            id: mainTimerView
        }

        SettingsView {
            id: secondPage
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }






}
