import QtQuick 2.12
import QtQuick.Controls 2.5


ApplicationWindow {
    id: root

    //property bool alwaysOnTop: false    //not jet functional

    width: Constants.default_app_width
    height: Constants.default_app_height
    visible: true
    title: qsTr("Timer")

//    onAlwaysOnTopChanged: { // TODO: https://stackoverflow.com/questions/57094057/qml-toggle-window-flags
//                        if(true)
//                            root.flags = root.flags | Qt.WindowStaysOnTopHint
//                        else
//                            root.flags = root.flags & ~Qt.WindowStaysOnTopHint
//                    }

    TimerView {
        id: mainTimerView
        visible: true
        anchors.fill: parent
    }

    SettingsView{
        id: settingsView
        visible: true

        height: 400//parent.height * 0.8
        width: 400//parent.width * 0.8

        anchors.centerIn: parent
    }
}
