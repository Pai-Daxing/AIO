import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14
Item {
    id: userView

    property alias userView: userView
    property alias userset_Return: userset_Return
    property alias permiss: permiss
    property alias username: username
    property alias passwd: passwd
    property alias userDel: userDel
    property alias userUpdate: userUpdate

    width: 1280
    height: 800

    Label {
        x: 40
        y: 43
        width: 128
        height: 49
        text: "系统设置 |"
        font.pixelSize: 50
        font.strikeout: false
        font.underline: false
        font.bold: true
        color: "#000000"
    }

    Label {
        x: 289
        y: 70
        width: 177
        height: 32
        text: "用户设置"
        color: "#000000"
        font.pixelSize: 28
    }

    Rectangle {
        x: 40
        y: 143
        height: 606
        width: 800
        visible: true
        color: "#DCDCDC"
        radius: 10

        Label{
            x: 31
            y: 106
            width: 61
            height: 38
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            text: "所属权限:"
            color: "#000000"
        }

        ComboBox {
            id: permiss
            x:149
            y:100
            width: 200
            height: 50
            model:["操作者", "管理员"]
            font.pixelSize: 22
            background: Rectangle {
                width: 200
                height: 50
                implicitWidth: 240
                implicitHeight: 50
                radius: 10
                border.color: permiss.focus ? "#1E90FF" : "#ffffff"
                border.width: 2
            }
        }

        Label{
            x: 31
            y: 206
            width: 61
            height: 38
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            text: "用 户 名:"
            color: "#000000"
        }

        MyTextField {
            id:username
            x: 149
            y: 200
            width: 200
            text: ""
            placeholderText: "请输入用户名";
        }

        Label{
            x: 31
            y: 306
            width: 61
            height: 38
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            text: "密     码:"
            color: "#000000"
        }

        MyTextField{
            id:passwd
            x: 149
            y: 300
            width: 200
            text: ""
            placeholderText: "请输入密码";
        }

        KeyButton {
            id: userDel
            x: 23
            y: 448
            width: 150
            height: 70
            text: qsTr("删除")
//            chooseBtnBack.border.color: control.focus ? "#1E90FF" : "#000000"
        }

        KeyButton {
            id: userUpdate
            x: 205
            y: 448
            width: 150
            height: 70
            text: qsTr("更新")
//            chooseBtnBack.border.color: control.focus ? "#1E90FF" : "#000000"
        }

    }

    KeyButton {
        id: userset_Return
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }
}

