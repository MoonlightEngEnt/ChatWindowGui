import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick 2.3

Row {

    property string comboTitleText:"add frame"
    property alias comboModel: combo.model

    Rectangle{
        id:titleRect
        width: parent.width
        height: parent.height
        border.color: 'black'
        border.width: 3

        Text {
            id:title
            text:comboTitleText
            anchors.top: parent.top;
            anchors.topMargin: parent.height *(0.30)
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }


    ComboBox {
        id:combo
        width:parent.width
        height:parent.height

    }


}
