import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

Row{
    property bool isTitleVisible: true
    property string ueListTitleText: "NET IDS"
    property string participantTitleText: "NET IDS"
    //        property alias ueListModel: ueListTableView.model
    //property alias chatModel: chatParticipantTableView.model
    property variant tableRoles: ["netID", "dataType"]
    property variant tableTitles: ["NET ID", "DATA TYPE"]
    property variant tableWidths: [100, 200]
    signal addParticipant
    signal removeParticipant



    NetIdTable{
        id: ueListTableView
        titleText: "UE LIST"
        width: parent.width *(0.45)
        height: parent.height *(0.85)
    }

    Column{
        id:biDirectional
        width: parent.width *(0.10)
        height: parent.height
        anchors.margins: 4

        Button {
            id:button1
            width:parent.width
            height:parent.height* (0.5)
            text:  'Add'
            visible: true
            enabled:  true
            onClicked:  {
                addParticipant()
            }
        }
        Button {
            id:button2
            width:parent.width
            height:parent.height* (0.5)
            text:  'Remove'
            visible: true
            enabled:  true
            onClicked:  {
                removeParticipant()
            }
        }

    }

    NetIdTable{
        id: chatParticipantTableView
        titleText: "Chat Particpants"
        width: parent.width *(0.45)
        height: parent.height *(0.85)
    }
}



