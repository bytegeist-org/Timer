pragma Singleton
import QtQuick 2.0

QtObject {
    id: appConst_

    readonly property int default_app_height: 500
    readonly property int default_app_width: 500

    readonly property color backgroundColor: "#2e3440"
    readonly property color accentColor1: "#3b4252"
    //readonly property color iconColor: "red"

    readonly property color textColor: "#81a1c1"
    readonly property color textColorWarning: "#bf616a"

    readonly property color ringColorBackground: "#3b4252"
    readonly property color ringColorNormal: "#4c566a"
    readonly property color ringColorInfo: "#d08770"
    readonly property color ringColorWarning: "#bf616a"

}
