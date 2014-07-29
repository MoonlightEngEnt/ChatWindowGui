import QtQuick 2.0

Rectangle {
    property variant currentMessageData: ["red", "RXPacket","Message Vaild"]
    signal curentMessageBoxClicked(int index)
    property int cellHeight
    property int cellWidth
    width: cellWidth -10
    height: cellHeight -10
    border.color: currentMessageData[0]
    border.width: 3


    MouseArea{
     anchors.fill: parent
        Column{
            anchors.fill: parent
            anchors.margins: 6
             Row{ id:titleRect; spacing:5; Text {id:title; text:"Type:"; } Text {id:detailValue; text:currentMessageData[1];} }
             Row{ id:titleRects; spacing:5; Text {id:titles; text:"Type:"; } Text {id:detailValues; text:currentMessageData[2];} }

        }
    }
}
