import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    property alias netIDModel: alarmTable.alarmTableIdModel
    signal netIDIndex(int index)
    signal netIDText(string text)

    onNetIDText: {
     console.log("Combo Value" + text)

    }
    TableView{
        property alias alarmTableIdModel: combo.model
        id: alarmTable
        //style: tableStyle
        width: 800
        height: 500
        TableViewColumn{role: "alarmName"; title:"ALARM NAME"; width: 150 }
        TableViewColumn{role: "state"; title:"STATE"; width: 100}

        TableViewColumn{

            role: "netID";
            title:"SELECT NET ID";
            width: 100; delegate:
           ComboBox{id: combo;
                onCurrentIndexChanged:{
                    netIDText(combo.textAt(currentIndex))
                    netIdIndex(currentIndex)
                }
            }


        model: alarmStatusModel

        itemDelegate: Item{

         Text{
             anchors.verticalCenter: parent.verticalCenter
             color:'red'
             text: styleData.value

         }
        }
    }
}
}
