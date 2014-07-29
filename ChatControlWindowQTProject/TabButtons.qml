import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

// Button Row
// size: 1200 X 200


Row {
    property int buttonWidth: 20
    property int buttonHeight: 20
    property int previousPressed:0
    property int titleSize:23
    property variant buttonsVisible: [] //fill dynamically
    property variant buttonsText:  ["but1","but2","but3","but4","but5","but6"]
    property variant buttonsEnabled: [true,true,true,true,true,true]
    signal buttonClicked(int buttonPressed)
    signal button2clicked
    signal button3clicked
    signal button4clicked
    signal button5clicked
    signal button6clicked
    property string tabTextColor: "#0DF5FD"

    property string buttonBorderColor: "#06361B"
    property int buttonBorderWidth: 3
    property string buttonColor: 'green'
    Repeater{
        model: buttonsVisible

        Button {
            id:button1
            width:buttonWidth
            height:buttonHeight
//            text:  buttonsText[index]
            visible: buttonsVisible[index]
            enabled:  buttonsEnabled[index]
            onClicked:  {
                buttonClicked(index+1)
                previousPressed = index
            }
            style: ButtonStyle{
                background: Rectangle{
                    property alias buttonData: button
                    id: button
                    implicitHeight: buttonHeight
                    implicitWidth: buttonWidth
                           color: (previousPressed == index) ?  "#06361B" : "#0A197C"
                           Rectangle{

                             id:top
                           width:buttonWidth
                           height: buttonBorderWidth
                           border.color: buttonBorderColor
                           border.width: buttonBorderWidth
                           visible: previousPressed == index
                               anchors.top: parent.top
                           }
                           Rectangle{
                           id:left
                           width:buttonBorderWidth*2
                           height: buttonHeight
                         border.color: buttonBorderColor
                         border.width: buttonBorderWidth *2
                         visible: previousPressed == index
                             anchors.left: parent.left
                         }
                           Rectangle{
                           id:right
                         width:buttonBorderWidth*2
                         height: buttonHeight
                         border.color: buttonBorderColor
                         border.width: buttonBorderWidth *2
                         visible: previousPressed == index
                             anchors.right: parent.right
                         }

                    Text {
                        id:title
                        text: buttonsText[index]
                        font.pixelSize: titleSize
                        wrapMode: Text.WordWrap
                        anchors.centerIn:  parent
                        visible: buttonsVisible[index]
                        color: tabTextColor
                        font.bold: true

                    }
                }
            }

        }
    }
}
