import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'
import 'widgets/'

Rectangle {
    id: header
    property string headerColor: "#0A197C" //"#06361B" green
    property string headerTitle: "Controller"
    property string headerBackgroundColor: "#0A197C"
    property string headerTextColor: "#0DF5FD"
    property string idColors: headerTextColor
    property string widgetBorderColor:  "#0DF5FD" //light blue
    property int widgetCenterRecBorderWidth:1
    property int idTextSize: 22
    property int titleSize: 23
    property variant currentMessageData: ["red", "9325235","Message Vaild"]
    gradient: Gradient {
          GradientStop { position: 0.43; color: "#0A197C" }
          GradientStop { position: 0.1; color: "#0DF5FD" }
         // GradientStop { position: 1.0; color: "green" }
      }

//    Rectangle{
//        id:titleRect
//        width: parent.width
//        height: 50
//        border.color: "#0A197C"
//        border.width: 3
//        color:"#0A197C"


   // }

    Rectangle {
        id:heading
        width: parent.width*(6/8)
        height: parent.height *(0.5)
        color: headerColor
        border.color: widgetBorderColor
        border.width: widgetCenterRecBorderWidth
        Text {
            id:title
            text:"DTCS CHAT"
            anchors.top: parent.top;

            font.pixelSize: titleSize
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            color:headerTextColor
        }
        anchors.topMargin: 50
        anchors.top: parent.top;
        anchors.horizontalCenter: parent.horizontalCenter

        Column{
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 6
             Row{ id:titleRectp; spacing:5; Text {id:titl; text:"Beam ID:"; color: idColors; font.pixelSize:idTextSize;  } Text {id:detailValue; text:currentMessageData[1]; color: idColors; font.pixelSize:idTextSize;} }
             Row{ id:titleRects; spacing:5; Text {id:titles; text:"LBFN:"; color: idColors; font.pixelSize:idTextSize; } Text {id:detailValues; text:currentMessageData[2]; color: idColors; font.pixelSize:idTextSize;} }

        }

        SignalStrengthWidget{
        id:signalStrengh
        width: heading.width* (0.10)
        height: heading.height* (0.3)
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
       // anchors.verticalCenter:  parent.verticalCenter
        }
        Row{ id:clock;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10
            anchors.left: signalStrengh.right;
            Text{id:time; text:"10:00"; color: idColors; font.pixelSize:idTextSize;  }
            Text {id:mode; text:"pm"; color: idColors; font.pixelSize:idTextSize;  }}
}


    Column{
        width: heading.width* (0.10)
        height: heading.height* (0.3)
        anchors.right: heading.right
        anchors.verticalCenter: heading.verticalCenter
        anchors.margins: 6
        Row{
            id:titleRec;
            spacing:5;
            anchors.right: parent.right;
            Text {
                id:ti;
                text:"Net:";
                color: idColors;
                font.pixelSize:idTextSize;
            }
            Text {
                id:detailVal;
                text:currentMessageData[1];
                color: idColors;
                font.pixelSize:idTextSize;
            }
        }
        Row{ id:titleRe; spacing:5; anchors.right: parent.right; Text {id:tit; text:"SV:"; color: idColors; font.pixelSize:idTextSize; } Text {id:detailValu; text:currentMessageData[2]; color: idColors; font.pixelSize:idTextSize;} }

    }
}
