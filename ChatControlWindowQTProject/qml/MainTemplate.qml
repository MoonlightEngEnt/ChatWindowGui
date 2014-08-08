import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Controls 1.2
import '../'
import '../widgets/'
import "../resources/style.js" as Skin

Rectangle {


    ListModel{
        id:alarmStatusModel
        ListElement {netID: "1234567" ; dataType: "RX_PACKET"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}
        ListElement {netID: "12345678" ; dataType: "RX_PACKET"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}
        ListElement {netID: "123456789" ; dataType: "RX_PACKET"; date:"03/21/14"; time:"02:00PM"; module:"System"; type:""}


    }
    ChatControlWindow{
        id:controlWindow
        width: 1200
        height: 550
        widgetControlBackgroundColor: Skin.CONTROL_WINDOW_BACKGROUND_COLOR

        Keys.onPressed: {
            if(event.key == Qt.Key_K){
                Qt.quit()
            }
        }
    }
    ChatStatusWindow{
        id:statusWindow
        width: 1200
        height: 550
        widgetStatusBackgroundColor: Skin.STATUS_WINDOW_BACKGROUND_COLOR

        Keys.onPressed: {
            if(event.key == Qt.Key_K){
                Qt.quit()
            }
        }
    }
    Rectangle{
        id: rect1
        color: 'yellow'
    }
    Rectangle{
        id: rect2
        color: 'black'
        property int stackStatus: rect2.Stack.status
        onStackStatusChanged: {
            console.log("Katy Ups "+rect2.Stack.status)
        }

        Text {
            id:title
            text:Stack.status
        }
    }
    Rectangle{
        id: rect3
        color: 'green'
        Text {
            id:titlesgs
            text:Stack.status
        }

    }

    Header {
        id: head
        width: 1200
        height: 250
        anchors.top: parent.top
        widgetHeaderTitle: Skin.HEADER_TITLE
        widgetHeaderTitleTextColor:Skin.HEADER_TITLE_TEXT_COLOR
        widgetHeaderTextColors: Skin.HEADER_TEXT_COLORS
        widgetCenterRectBackgroundColor: Skin.HEADER_BACKGROUND_MIDDLE_RECT_COLOR
        widgetHeaderBackgroundColor: Skin.HEADER_BACKGROUND_COLOR
    }
    TabButtons{
        id:tabButtons
        width: 1200
        height: 100
        buttonWidth:tabButtons.width/buttonsVisible.length
        buttonHeight: tabButtons.height
        buttonsVisible: [true,true]
        buttonsText: [Skin.TAB_TITLE_1,Skin.TAB_TITLE_2]
        tabTextColor: Skin.TAB_TEXT_COLOR
        anchors.top: head.bottom
        tabSelectedColor: Skin.TAB_SELECTED_COLOR
        tabUnselectedColor: Skin.TAB_UNSELECTED_COLOR

        onButtonClicked: {
            switch(buttonPressed){
            case 1:
                if( controlWindow == stack.currentItem) {
                    stack.push({item:controlWindow,immediate:true})
                }
                else if( statusWindow == stack.currentItem) {
                    stack.push({item:controlWindow,immediate:true})
                }
                break
            case 2:
                if( controlWindow == stack.currentItem) {
                    stack.push({item:statusWindow,immediate:true})
                }
                else if( statusWindow == stack.currentItem) {
                    stack.push({item:statusWindow,immediate:true})
                }
                break
            }
        }
    }
    StackView{
        id:stack
        width: 1200
        height: 550
        initialItem: controlWindow

        anchors.top: tabButtons.bottom
    }
}
