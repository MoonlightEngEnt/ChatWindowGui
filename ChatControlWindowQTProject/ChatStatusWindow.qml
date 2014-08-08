import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import '../'
import './'
import 'widgets/'
import "resources/style.js" as Skin


Rectangle {
    id: statusWindow
    property alias widgetStatusBackgroundColor: statusWindow.color
//    gradient: Gradient {
//          GradientStop { position: 0.0; color: "#06361B" }
//          GradientStop { position: 0.83; color: "#0A197C" }
//      }

    ListModel{
     id:packets
    }

    Connections{
     target: framePacket
     onPacketDataChanged:{
        packets.append({'color': framePacket.packetData[0],
                                       'dataOne': framePacket.packetData[1],
                                       'dataTwo': framePacket.packetData[2]})

         currentMessage.widgetBoxColor = packets.get(packets.count-1).color == 1 ? "red" : "yellow"
         currentMessage.widgetDataOne = packets.get(packets.count-1).dataOne
         currentMessage.widgetDataTwo = packets.get(packets.count-1).dataTwo
     }

    }

    GridLayoutCCW{
        id: gridLayout
        height: parent.height
        width: parent.width*(2/3)
        gridRepeaterModel:packets

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
                    height: parent.height*(3/10)
                    width: parent.width* (0.98)
                    widgetTitleBorderColor: Skin.TITLE_BORDER_COLOR
                    widgetTitleBorderWidth: Skin.TITLE_BORDER_WIDTH
                    widgetTitleTextColor: Skin.TITLE_TEXT_COLOR
                }
                ChatStatusOptionsWidget{
                    id:chatStatusOptionsWidget
                    anchors.top: messageDetailsWidget.bottom
                    height: parent.height*(3/10)
                    width: parent.width* (0.98)
                    widgetTitleBorderColor: Skin.TITLE_BORDER_COLOR
                    widgetTitleBorderWidth: Skin.TITLE_BORDER_WIDTH
                    widgetTitleTextColor: Skin.TITLE_TEXT_COLOR

                }
                TitleWidget{
                 id:currentMessageTitle
                 textEditText: "Current Message"
                 anchors.top: chatStatusOptionsWidget.bottom
                 height: parent.height*(1/10)
                 width: parent.width* (0.98)
                 widgetBorderColor:  Skin.TITLE_BORDER_COLOR
                 widgetBorderWidth: Skin.TITLE_BORDER_WIDTH
                 widgetTextColor: Skin.TITLE_TEXT_COLOR
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
