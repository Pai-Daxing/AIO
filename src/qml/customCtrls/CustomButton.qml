import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Button{
    id: control
    text: qsTr("")

    property alias myrec :myrec
    property alias chtext: chtext
    property alias statustext: statustext
    property alias timetext: timetext
    property alias protext: protext
    property alias statusRec: statusRec


    font.family: "微软雅黑"
    font.pixelSize: 22

    MyColors {
        id : cs_color
    }

    width: 200
    height: 150
    contentItem: Item {
        Rectangle {
            id: statusRec
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 10
            width: 25
            height: 25
            radius: 25
            color: "#FFFF00"
        }

//        Image {
//            id: locklogo
//            anchors.right: parent.right
//            anchors.rightMargin: 5
//            anchors.top: parent.top
//            anchors.topMargin: 10
//            width: 25
//            height: 25
//            source: "qrc:/res/lock.png"
//            visible: control.enabled = true ? true : false
//        }

        MyLabel{
            id: chtext
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        MyLabel{
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: chtext.bottom
            anchors.topMargin: 5
            text: "状态： "
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MyLabel{
            id: statustext
            anchors.left: parent.left
            anchors.leftMargin: 80
            anchors.top: chtext.bottom
            anchors.topMargin: 5
            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        MyLabel{
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: statustext.bottom
            anchors.topMargin: 5
            width: 150
            text: "剩余时间：  "
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MyLabel{
            id: timetext
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.top: statustext.bottom
            anchors.topMargin: 5
            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        MyLabel{
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: timetext.bottom
            anchors.topMargin: 5
            width: 150
            text: "检测工艺： "
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MyLabel{
            id: protext
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.top: timetext.bottom
            anchors.topMargin: 5
            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }


    background: Rectangle{
        id: myrec
        anchors.fill: parent
        radius: 10
        color: (control.pressed || control.checked || !enabled) ? "#F8F8FF" : "#D3D3D3"
        border.color: (control.pressed || control.checked || !enabled) ? "#F8F8FF" : "#000000"
    }
}
