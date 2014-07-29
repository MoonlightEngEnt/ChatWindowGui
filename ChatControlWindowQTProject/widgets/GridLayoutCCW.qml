import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import "../widgets/"

ScrollView{
    id:chatSessionInfo
    width: parent.width
    height: parent.height
    property string blenderButtonColors: 'blue'
    property alias gridRepeaterModel: gridView.model
    frameVisible: true

    GridView{
        id:gridView
        width: parent.width
        height: parent.height
        cellHeight:  190
        cellWidth:  190
        anchors.margins: 10


        model: 500
        delegate:
            CurrentMessageBox{
            id: currentMessage
            cellHeight: gridView.cellHeight
            cellWidth: gridView.cellWidth
             }
//            Button{
//            style: ButtonStyle{
//                background: Rectangle{
//                    id: buttonRecRightBlenders
//                    implicitHeight: 60
//                    implicitWidth: 60
//                    radius: 100
//                    border.color: 'black'
//                    border.width: 3

//                    color: blenderButtonColors
//                }
//            }
//            onClicked: {
//                blenderButtonColors = 'green'
//            }
//        }


    }
}
