import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'

Grid{
    property variant buttonNames: ["NET Attach","NET Dettach","UE Attach","UE Detach"]
    signal quadButtonsPressed(int index)
    width: parent.width
    height: parent.height
    columns: 2
    rows:2
    Repeater{
        id: gridRepeater
        model: 4
        width: parent.width
        height: parent.height
        Button {
            id:button1
           width:parent.width* (0.5)
            height:parent.height* (0.5)
            text:  buttonNames[index]
            visible: true
            enabled:  true
            onClicked:  {
//                addParticipant()
            }
        }
    }

}


