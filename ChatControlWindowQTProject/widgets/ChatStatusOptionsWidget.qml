import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'
Rectangle{
    width: parent.width
    height: parent.height
    border.color: 'black'
    border.width: 3

    TitleWidget{id:detailsTitle;
        width: parent.width
        height: parent.height *(0.3)
        textEditText: "Message Details"}
    Column {
        id:details
        width: parent.width
        height: parent.height *(0.7)
        anchors.top: detailsTitle.bottom

        TextEditCCW {id: saveFile; width: parent.width*(0.5); height: parent.height*(1/4); textEditText:"Save File"}
        TextEditCCW {id: logFile; width: parent.width*(0.5); height: parent.height*(1/4); textEditText:"Log File"}
        Row{
          width: parent.width; height: parent.height*(0.5);
          Button{id:playButton; text: "Play";width: parent.width*(0.5); height: parent.height;}
          Button{id:pauseButton; text: "Pause";width: parent.width*(0.5); height: parent.height;}
        }
    }
}
