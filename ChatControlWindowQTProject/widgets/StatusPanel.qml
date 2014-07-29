import QtQuick 2.0

Rectangle {
    height: parent.height
    width: parent.width

    MessageDetailsWidget{
     id:messageDetailsWidget

     height: parent.height
     width: parent.width
    }
    ChatStatusOptionsWidget{
     id:chatStatusOptionsWidget
     //anchors.left: gridLayout.right
     anchors.top: messageDetailsWidget.bottom
     height: parent.height
     width: parent.width
    }
}
