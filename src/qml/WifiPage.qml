import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14

Item {
    id: wifi

    property alias wifiset_Return: wifiset_Return
    property alias wifiName: wifiName
    property alias wifiPasswd: wifiPasswd

    width: 1280
    height: 800
    visible: false

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
        text: "无线连接"
        color: "#000000"
        font.pixelSize: 28
    }

    Rectangle {
        x: 40
        y: 143
        height: 606
        width: 800
        radius: 10
        color: "#DCDCDC"

        Label{
            x: 195
            y: 140
            width: 60
            height: 40
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "WIFI名称:"
            color: "#000000"
        }

        MyTextField {
            id:wifiName
            x: 285
            y: 140
            text: ""
            placeholderText: "请输入WIFI名称";
        }

        Label{
            x: 195
            y: 290
            width: 60
            height: 40
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "密       码:"
            color: "#000000"
        }

        MyTextField{
            id:wifiPasswd
            x: 285
            y: 290
            text: ""
            placeholderText: "请输入密码";
        }

        KeyButton {
            id: wifi_OK
            x: 280
            y: 410
            width: 200
            height: 70
            text: qsTr("连接")
//            chooseBtnBack.border.color: control.focus ? "#1E90FF" : "#000000"
        }

    }

    KeyButton {
        id: wifiset_Return
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }
}
