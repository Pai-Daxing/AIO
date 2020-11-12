import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0 as Controls20
import QtQuick.Layouts 1.3

Item {
    id: tech
    width: 550
    height: 545
    property var rsltTableArray:
        [["工艺名称", "步骤", "取物孔", "置物孔", "移液量", "混合次数", "更换TIP头"],
        [80,50,70,70,70,80,100],
        ["techname", "steps","fetchhole","rhole", "mwv" ,"mixnum","tip"]]
    property alias techtable: techtable

    UserView {
        id: techtable
        anchors.fill: parent
        Component.onCompleted: {
            techtable.updateColumn2Table(tech.rsltTableArray);    //创建表
        }
    }
}
