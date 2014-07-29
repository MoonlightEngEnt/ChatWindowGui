import QtQuick 2.0
import "resources/style.js" as Skin
Rectangle{
    id:titleRect
    property string textEditText:"add frame"
    property alias widgetBackgroundColor: titleRect.color
    property string widgetBorderColor:  Skin.TITLE_BORDER_COLOR
    property int widgetBorderWidth: Skin.TITLE_BORDER_WIDTH
    property string widgetTextColor: Skin.TITLE_TEXT_COLOR
    property alias widgetTextSize: title.font.pixelSize
    width: parent.width
    height: parent.height
    border.color:widgetBorderColor
    border.width: widgetBorderWidth
    color: "#0A197C"

    Text {
        id:title
        text:textEditText
        anchors.top: parent.top;
        anchors.topMargin: parent.height *(0.30)
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
        color: widgetTextColor
        font.bold: true
    }
}
