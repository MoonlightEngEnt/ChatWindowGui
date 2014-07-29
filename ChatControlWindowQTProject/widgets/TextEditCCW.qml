import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick 2.3

Row {


    property string textEditText:"add frame"
    property string watermark: "watermark"
    property string previousText
    Rectangle{
        id:titleRect
        width: parent.width
        height: parent.height
        border.color: 'black'
        border.width: 3

        Text {
            id:title
            text:textEditText
            anchors.top: parent.top;
            anchors.topMargin: parent.height *(0.30)
            anchors.horizontalCenter: parent.horizontalCenter


        }
    }

    Rectangle{
        width: parent.width
        height: parent.height
        border.color: 'black'
        border.width: 3
        TextEdit {
            id:textEdit
            text:watermark
            width:parent.width
            height:parent.height
            wrapMode: TextEdit.WordWrap
            verticalAlignment: TextEdit.AlignVCenter
            horizontalAlignment: TextEdit.AlignHCenter
            cursorPosition: 15
            onTextChanged: {
                if(text.length > 32){
                    text = previousText
                }
                previousText =text


            }
        }
    }

}
