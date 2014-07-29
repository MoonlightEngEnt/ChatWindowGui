import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'
import './'
import 'widgets/'

Rectangle {
    gradient: Gradient {
          GradientStop { position: 0.0; color: "#06361B" }
          GradientStop { position: 0.83; color: "#0A197C" }
      }
    GridLayoutCCW{
        id: gridLayout
        height: parent.height
        width: parent.width*(2/3)

    }
    ScrollView{
        id:scroll
        height: parent.height
        width: parent.width*(1/3)
        anchors.left: gridLayout.right
        anchors.top: parent.top
        frameVisible: true
        viewport.data:           Rectangle {
                height: parent.height
                width: parent.width* (0.88)

                MessageDetailsWidget{
                    id:messageDetailsWidget
                    // anchors.left: gridLayout.right
                    // anchors.top: parent.top
                    height: parent.height*(3/10)
                    width: parent.width* (0.98)
                }
                ChatStatusOptionsWidget{
                    id:chatStatusOptionsWidget
                    // anchors.left: gridLayout.right
                    anchors.top: messageDetailsWidget.bottom
                    height: parent.height*(3/10)
                    width: parent.width* (0.98)
                }
                TitleWidget{
                 id:currentMessageTitle
                 textEditText: "Current Message"
                 anchors.top: chatStatusOptionsWidget.bottom
                 height: parent.height*(1/10)
                 width: parent.width* (0.98)
                }
                CurrentMessageBox{
                    id: currentMessage
                    cellHeight: parent.height*(3/10)
                    cellWidth: parent.width* (0.98)
                    anchors.top: currentMessageTitle.bottom
                    anchors.margins:8
                }


            }
        }
}
