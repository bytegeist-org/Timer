import QtQuick 2.0

Item {
    id: root

    Rectangle{
        id:timeRemaining
        color: "#099956" //TODO: remove and change to Item

        anchors.fill: parent
        anchors.centerIn: parent

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            text: "test"
            font.pixelSize: 14
        }

    }


}
