import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'
import 'widgets/'

Rectangle {
    width: 1200
    height: 550
    property variant buttonNames: ["Deattach","Deattach","Deattach","Deattach"]
    property int marginValue:12
    property string controlBackgroundColor: "#06361B"
    property string controlTextColor: "#0DF5FD"
    property string controlAddFrameBackgroundColor:"#0A197C"
    property string controlAddFrameBorderColor:"#06361B" // Green
    signal quadButtonsPressed(int index)
    gradient: Gradient {
          GradientStop { position: 0.0; color: controlBackgroundColor }
          GradientStop { position: 0.83; color: "#0A197C" }
      }
    ListModel {
        id: testmodel
        ListElement { text: "Banana"; color: "Yellow" }
        ListElement { text: "Apple"; color: "Green" }
        ListElement { text: "Coconut"; color: "Brown" }
    }

        AddFrameWidgetSimple{
            id:addFrameSimple
            height: parent.height*(1/4)
            width:parent.width *(0.5)-(marginValue*2)
            anchors.top: parent.top
            anchors.topMargin:marginValue
            anchors.margins:marginValue
            anchors.left: parent.left
            anchors.leftMargin: marginValue

        }
        QuadButtonWidget{
         id:quadButtonWidget
         height: parent.height*(1/4) + parent.height*(1/8)-marginValue
         width:parent.width*(0.5)-marginValue
         anchors.top: parent.top
         anchors.topMargin:marginValue
         anchors.left: addFrameSimple.right
         anchors.leftMargin: marginValue
         anchors.margins:marginValue
        }

    Rectangle{
        id:addFrameButton
        width:parent.width*(0.5)-(marginValue*2)
        height: parent.height*(1/8)-marginValue
        visible: true
        border.color: controlAddFrameBorderColor
        border.width: 4
        anchors.top: addFrameSimple.bottom
        anchors.left: parent.left
        anchors.leftMargin: marginValue
        color: controlAddFrameBackgroundColor

        Button {
            id:button1
            width:parent.width*(1/4)
            height: parent.height*(1/2)
            text:  "Add Frame"
            anchors.top: parent.top
            anchors.topMargin: addFrameButton.height *(0.30)
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
             controlModel.addFrame();
            }

        }
    }

    MarriedTablesWidget{
        id: marriedTables
        height: parent.height*(1/4)-(marginValue*2)
        width:parent.width -(marginValue*2)
        anchors.top: addFrameButton.bottom
        anchors.left: parent.left
        anchors.leftMargin: marginValue
        anchors.margins:marginValue
    }
    NetIdTable{
        id:netIdTable
        height: parent.height*(1/4)-(marginValue*2)
        width:parent.width -(marginValue*2)
        netIdTableModel: alarmStatusModel
        anchors.top: marriedTables.bottom
        anchors.topMargin: (marginValue*2)
        anchors.left: parent.left
        anchors.leftMargin: marginValue
        anchors.margins:marginValue

    }
}
