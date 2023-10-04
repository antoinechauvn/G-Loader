import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "./components"

ApplicationWindow {
    id: window
    title: "G-Loader UI"
    maximumHeight: 600
    maximumWidth: 300
    minimumHeight: 600
    minimumWidth: 300
    visible: true
    color: "#232020"
    flags: Qt.Dialog | Qt.WindowFixedSize

    ListModel {
        id: userModel

        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
        ListElement {
            name: "Made by Armanta"
            url: "https://www.habbo.com.br/habbo-imaging/avatarimage?figure=hr-3163-49.hd-180-2.ch-3323-1324-92.lg-3058-92.sh-3016-1324.ea-3484.fa-3276-95&direction=3&size=l.0&head_direction=3&headonly=1"
        }
    }

    ListView {
        id: userViewer
        anchors.fill: parent
        anchors.topMargin: 18
        spacing: 3
        model: userModel

        ScrollIndicator.vertical: ScrollIndicator {
            id: control

            contentItem: Rectangle {
                implicitWidth: 5
                radius: 10
                color: "#2A2B2A"
            }
        }

        delegate: User{
            width: userViewer.width
            nickname: name
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
