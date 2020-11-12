import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Button{
    id: control
    text: qsTr("Button")
    property alias btnIcon :btnIcon
    property bool bHasIcon: false
    property var  bgColor: "#D3D3D3"

    font.family: "微软雅黑"
    font.pixelSize: 24

    MyColors {
        id : m_color
    }

    implicitWidth: 50
    implicitHeight: 50

    contentItem: Item {
        Image {
            id : btnIcon
            visible: control.enabled
            opacity: control.down ? 0.5 : 1.0

            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.left: parent.left
//            anchors.leftMargin: 3
//            anchors.top: parent.top
//            anchors.topMargin: 10

            source: "/res/Administrator.png"
            sourceSize.width: 50
            sourceSize.height: 50
        }
    }

    background: Rectangle {
        implicitWidth: 50
        implicitHeight: 40
        opacity: control.down ? 0.5 : 1.0
        radius: 10
        color: "#D3D3D3"
        scale: control.pressed ? 0.99 : 1.0
    }
}
