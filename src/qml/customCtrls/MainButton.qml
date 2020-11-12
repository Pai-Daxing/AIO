import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Button{
    id: control
    text: qsTr("Button")
    property alias btnIcon :btnIcon
    property bool bHasIcon: false
    property var  bgColor: "#1E90FF"

    font.family: "微软雅黑"
    font.pixelSize: 24

    MyColors {
        id : m_color
    }

    implicitWidth: 200
    implicitHeight: 200

    contentItem: Item {
        Image {
            id : btnIcon
            visible: control.enabled
            opacity: control.down ? 0.5 : 1.0

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 3

            source: "/res/save.png"
            sourceSize.width: 100
            sourceSize.height: 100
        }

        MyLabel{
            anchors.horizontalCenter: btnIcon.horizontalCenter
            anchors.top: btnIcon.bottom
            anchors.topMargin: 60
            anchors.fill: (bHasIcon)?undefined:parent

            text: control.text
            font: control.font
            opacity: control.down ? 0.5 : 1.0
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 190
        opacity: control.down ? 0.5 : 1.0
        radius: 10
        color: bgColor
        scale: control.pressed ? 0.99 : 1.0
    }
}
