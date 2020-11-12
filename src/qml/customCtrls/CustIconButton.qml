import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Button{
    id: control
    text: qsTr("Button")

    property alias btnIcon :btnIcon
    property alias myrec :myrec
    property alias mytext: mytext

    font.family: "微软雅黑"
    font.pixelSize: 22

    MyColors {
        id : cs_color
    }

    width: 150
    height: 150
    contentItem: Item {
        Image {
            id : btnIcon
            visible: control.enabled
            opacity: control.down ? 0.5 : 1.0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            source: "/res/Administrator.png"
            sourceSize.width: 120
            sourceSize.height: 120
        }

        MyLabel{
            id: mytext
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    background: Rectangle{
        id: myrec
        anchors.fill: parent
        radius: 10
        color: (control.pressed || control.checked || !enabled) ? "#565656" : "#D3D3D3"
    }
}
