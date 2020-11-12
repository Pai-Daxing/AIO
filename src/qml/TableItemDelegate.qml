import QtQuick 2.7
import QtQuick.Controls 1.4

Rectangle{
    id: tableCell
    anchors.fill: parent;
    border.color: "#ffffff"
    border.width: 1
    color: styleData.selected ? "#1E90FF" : "transparent";

    Text{
        id: textID;
        text:styleData.value ;
        font.family: "微软雅黑";
        font.pixelSize: 16;
        anchors.fill: parent;
        color: "#000000";
        elide: Text.ElideRight;
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
