import QtQuick 2.0

Rectangle {
    property variant currentMessageData: ["red", "RXPacket","Message Vaild"]
    signal curentMessageBoxClicked(int index)
    property int cellHeight
    property int cellWidth
    property string widgetBoxColor: currentMessageData[0]
    property string widgetDataOne: currentMessageData[1]
    property string widgetDataTwo: currentMessageData[2]
    width: 0
    height:  cellHeight -10;
    border.color: widgetBoxColor
    border.width: 3


    MouseArea{
     anchors.fill: parent
        Column{
            anchors.fill: parent
            anchors.margins: 6
             Row{
                 id:titleRect;
                 spacing:5;
                 Text {
                     id:title;
                     text:"Type:";
                 }
                 Text {
                     id:detailValue;
                     text:widgetDataOne
                 }
             }
             Row{
                 id:titleRects;
                 spacing:5;
                 Text {
                     id:titles;
                     text:"Type:";
                 }
                 Text {
                     id:detailValues;
                     text:widgetDataTwo
                 }
                 }

        }
    }

    NumberAnimation on width  { to: cellWidth -10; duration: 1500 }
    //NumberAnimation on height  { to: cellHeight -10; duration: 5000 }
}
