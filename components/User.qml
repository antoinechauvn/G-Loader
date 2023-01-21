import QtQuick

Item {
    width: 140
    height: 50
    property string username
    property string figure_url

    Rectangle {
        id: rectangle
        color: "#864f4f4f"
        radius: 15
        anchors.fill: parent
    
        Text {
            id: text1
            y: 17
            text: username
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: image
            x: 0
            y: -6
            width: 54
            height: 62
            source: figure_url
            fillMode: Image.PreserveAspectFit
        }
    }

}
