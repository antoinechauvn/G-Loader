import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "./components"

Window {
    id: window
    title: "G-Loader UI"
    width: 300
    height: 600
    visible: true
    color: "#232020"
    flags: Qt.WindowStaysOnTopHint

    ListModel {
            id: userModel
            ListElement {
                name: "Made by Armanta"
                url: "https://www.habbo.com/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
                }
    }

    ScrollView {
        anchors.fill: parent
        //ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        ListView {
            id: userViewer
            anchors.fill: parent
            anchors.topMargin: 25
            spacing: 3
            model: userModel

            delegate: User{
                width: userViewer.width
                username: name
                figure_url: url
            }

            Connections{
                target: userContainer
                function onClear() {
                    userModel.clear()
                }

                function onAppend(user, url) {
                    userModel.append({"name": user, "url": url})
                    }
                    
                function onRemove(index) {
                    userModel.remove(index)
                    }

                }
        }
    }
}
