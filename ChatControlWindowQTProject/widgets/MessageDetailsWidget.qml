import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'

Rectangle{
    property string widgetBorderColor:  "#0DF5FD" //light blue
    property alias widgetTitleBorderColor: detailsTitle.widgetBorderColor
    property alias widgetTitleBorderWidth: detailsTitle.widgetBorderWidth
    property alias widgetTitleTextColor: detailsTitle.widgetTextColor
    property alias widgetTitleTextSize: detailsTitle.widgetTextSize
    width: parent.width
    height: parent.height
    border.color: widgetBorderColor
    border.width: 3

    TitleWidget{
        id:detailsTitle;
        width: parent.width
        height: parent.height *(0.3)
        textEditText: "Message Details"}
    Column {
        id:details
        width: parent.width
        height: parent.height *(0.70)
        DetailWidget{id:rxPacket}
        DetailWidget{id:messageType}
        DetailWidget{id:ueStatus}
        DetailWidget{id:assignmentID}
        anchors.top: detailsTitle.bottom
    }
}
