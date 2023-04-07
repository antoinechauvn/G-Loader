import QtQuick

Item {
    width: 140
    height: 50
    property string nickname
    property string figure_url

    Rectangle {
        id: rectangle
        color: "#864f4f4f"
        radius: 15
        anchors.fill: parent
    
        Text {
            id: username
            y: 17
            text: nickname
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: profile_picture
            x: 0
            y: -6
            width: 54
            height: 62
            source: figure_url
            fillMode: Image.PreserveAspectFit
        }
    }

}
