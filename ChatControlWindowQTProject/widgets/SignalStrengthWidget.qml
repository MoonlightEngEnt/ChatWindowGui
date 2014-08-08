import QtQuick 2.0

Rectangle {
    property string signalStrenghBackgroundColor:"#0A197C"
    property string signalStrenghRectangleBorderColor:"#0DF5FD"
    property string signalStrenghRectangleFillColor:"#0DF5FD"
    color:signalStrenghBackgroundColor
    width: parent.width
    height: parent.height*(1/2)
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 10
    Rectangle{
        id:low
        width: parent.width *(1/4)
        height: parent.height *(1/4)
        border.color: signalStrenghRectangleBorderColor
        color: signalStrenghRectangleFillColor
        border.width: 3
        anchors.margins: 4
        anchors.right: med.left
        anchors.bottom: parent.bottom
    }
    Rectangle{
        id:med
        width: parent.width *(1/3)
        height: parent.height*(6/10)
        border.color: signalStrenghRectangleBorderColor
        color: signalStrenghRectangleFillColor
        border.width: 3
        anchors.margins: 4
        anchors.right: high.left
        anchors.bottom: parent.bottom

    }
    Rectangle{
        id:high
        width: parent.width *(1/3)
        height: parent.height
        border.color: signalStrenghRectangleBorderColor
        color: signalStrenghRectangleFillColor
        border.width: 3
        anchors.margins: 4
        anchors.bottom: parent.bottom
        anchors.left: med.right
    }



}
