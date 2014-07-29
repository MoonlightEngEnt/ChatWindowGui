import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

Button{
    id:self
    property int buttonHeight: parent.height
    property int buttonWidth: parent.width
    property int buttonRadius: 4
    property string buttonBorderColor: 'black'
    property int buttonBorderWidth: 3
    property string buttonColor: 'green'
    property alias buttonImageSource: self.iconSource
    property alias buttonText: self.text
    property bool buttonVisible: true

    signal buttonClicked


    style: ButtonStyle{
        background: Rectangle{
            property alias buttonData: button
            id: button
            implicitHeight: buttonHeight
            implicitWidth: buttonWidth
            radius: buttonRadius
            border.color: buttonBorderColor
            border.width: buttonBorderWidth
            visible: buttonVisible
            color: buttonColor


            Text {
                id:title
                text: buttonsText[index]
 //               font.pixelSize: titleSize
                wrapMode: Text.WordWrap
                anchors.centerIn:  parent
                visible: buttonVisible
            }
        }
    }
    onClicked: {
       buttonClicked()
    }
}
