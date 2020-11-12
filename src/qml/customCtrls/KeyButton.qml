import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Button{
    id: control
    text: qsTr("")
    property bool bHasIcon: false
    property var  bgColor: "#D3D3D3"
    property alias chooseBtnBack: chooseBtnBack
    property alias btnIcon: btnIcon
    property alias control: control
//    font.family: "微软雅黑"
    font.pixelSize: 24
    opacity: control.down ? 0.5 : 1.0

    MyColors {
        id : m_color
    }

    implicitWidth: 140
    implicitHeight: 50

    Image {
        id : btnIcon
        opacity: control.down ? 0.5 : 1.0

        anchors.verticalCenter: control.verticalCenter
        x:10

        source: ""
        sourceSize.width: 30
        sourceSize.height: 30
    }

//    MyLabel{
//        id: lab
//        anchors.horizontalCenter: control.horizontalCenter
//        anchors.verticalCenter: control.verticalCenter
//        //            anchors.topMargin: 3
//        //            anchors.left: parent.left
//        //            anchors.leftMargin: 30
//        anchors.fill: (bHasIcon)?undefined:parent

////        text: control.text
////        font: control.font
//        opacity: control.down ? 0.5 : 1.0
//        color: "#000000"
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//        elide: Text.ElideRight
//    }

    background: Rectangle {
        id: chooseBtnBack
        implicitWidth: 140
        implicitHeight: 50
        opacity: control.down ? 0.5 : 1.0
        radius: 6
        color: "#D3D3D3"
        scale: control.pressed ? 0.99 : 1.0
        border.color: "#808080"
//        border.color: control.focus ? "#1E90FF" : "#D3D3D3"
//        border.width: 2
    }
}
