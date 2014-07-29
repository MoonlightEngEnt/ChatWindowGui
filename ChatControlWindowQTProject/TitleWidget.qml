import QtQuick 2.0

Rectangle{
    id:titleRect
    property string textEditText:"add frame"
    property alias widgetBackgroundColor: titleRect.color
    property string widgetBorderColor:  "#0DF5FD" //light blue
    property alias widgetTextColor: title.color
    property alias widgetTextSize: title.font.pixelSize
    width: parent.width
    height: parent.height
    border.color:widgetBorderColor
    border.width: 3
    color: "#0A197C"

    Text {
        id:title
        text:textEditText
        anchors.top: parent.top;
        anchors.topMargin: parent.height *(0.30)
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
        color: widgetBorderColor
        font.bold: true
    }
}
