import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick 2.3

Column {
  //  property alias netIDComboModel: netIDCombo.model
  //  property alias dataTypeComboModel: dataTypeCombo.model

    ComboBoxCCW {id: combo1; width: parent.width*(0.5); height: parent.height*(1/4); comboTitleText:"SELECT NET ID"}
    TextEditCCW {id: combo2; width: parent.width*(0.5); height: parent.height*(1/4); textEditText:"ADD UE"}
    ComboBoxCCW {id: combo3; width: parent.width*(0.5); height: parent.height*(1/4); comboTitleText:"DATA TYPE"}
    TextEditCCW {id: combo4; width: parent.width*(0.5); height: parent.height*(1/4); textEditText:"OFFSET"}

}
