import QtQuick 2.0

Rectangle {
    id: popUp
    property string errorPopUpColor: "#CC000000"
    property string errorPopUpBorderColor: "#5500aeef"
    property alias errorPopUpText: popUpText.text

    color: errorPopUpColor
    opacity: 1
    smooth: true
    visible: false
    radius: 10
    border.color: errorPopUpBorderColor
    border.width: 2
    height: parent.height
    width: parent.width - 10

    Text{
        id: popUpText
        anchors.centerIn: parent
        color: "white"
        text: "X"
        font.pointSize: 14
    }

    //Exit button
    Rectangle {
        id: popUpQuit
        height: 30
        width: 30
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.top: parent.top
        color: "red"
        radius: 5
        opacity: 0.62

        MouseArea{
            anchors.fill:parent
            onPressed: {
                popUp.visible = false
            }
        }



    }
}
