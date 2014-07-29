import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

Rectangle {
    property alias netIdTableModel: netIdTableView.model
    property int numbertOfTableColumns: 2
    property int titleHeight: 40
    property variant tableRoles: ["netID", "dataType"]
    property variant tableTitles: ["NET ID", "DATA TYPE"]
    property variant tableWidths: [100, 200]
    property bool isTitleVisible: true
    property string titleText: "NET IDS"
    property int stackStatus: rect1.Stack.status
    property string tableTitleTextColor: "#0DF5FD" // light Blue
    property string tableTitleBackgroundColor:"#0A197C" // dark Blue
    property string tableTitleBorderColor: "#0DF5FD"
    onStackStatusChanged: {
        console.log("Katy Ups "+rect1.Stack.status)
        switch(status){
        case Stack.Activating:
            console.log("Kate Upton")

            break
        case Stack.Active:
            console.log("Kate Upton Here")

            break
        }
    }
    //    Stack {
    //        view:stack
    //        switch(status){
    //         case Stack.Activating:
    //             console.log("Kate Upton")
    //             break
    //         case Stack.Active:
    //             console.log("Kate Upton Here")

    //             break
    //        }
    //    }


    Rectangle{
        id:titleRect
        width:netIdTableView.width
        height: titleHeight
        visible: isTitleVisible
        border.color: tableTitleBorderColor
        border.width: 3
        color: tableTitleBackgroundColor

        Text {
            id:title
            text:titleText
            anchors.top: parent.top
            anchors.topMargin: parent.height *(0.30)
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: tableTitleTextColor
            visible: isTitleVisible
            font.bold: true

        }
    }

    TableView{
        id: netIdTableView
        //style: tableStyle
        width: parent.width
        height: parent.width
        anchors.top: titleRect.bottom



        TableViewColumn{role: tableRoles[0]; title:tableTitles[0]; width: tableWidths[0]}
        TableViewColumn{role: tableRoles[1]; title:tableTitles[1]; width: tableWidths[1]}



    }

}
