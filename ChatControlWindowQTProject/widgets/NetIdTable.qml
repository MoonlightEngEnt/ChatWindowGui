import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

import "../widgets"
import "../"
import "../resources/style.js" as Skin

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

    TitleWidget{
     id:titleRect
     textEditText: titleText
     width:netIdTableView.width
     height: titleHeight
     widgetBorderColor:  Skin.TITLE_BORDER_COLOR
     widgetBorderWidth: Skin.TITLE_BORDER_WIDTH
     widgetTextColor: Skin.TITLE_TEXT_COLOR
    }

    TableView{
        id: netIdTableView
        width: parent.width
        height: parent.width
        anchors.top: titleRect.bottom

        TableViewColumn{role: tableRoles[0]; title:tableTitles[0]; width: tableWidths[0]}
        TableViewColumn{role: tableRoles[1]; title:tableTitles[1]; width: tableWidths[1]}
    }
}
