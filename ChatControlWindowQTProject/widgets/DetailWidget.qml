import QtQuick 2.0
Rectangle{
    property alias titleText: title.text
    property alias detailValue: detailValue.text


    Row{ id:titleRect; spacing:5; Text {id:title} Text {id:detailValue} }

}
