import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    width: 800
    height: 1280

    property alias passwd: passwd
    property alias loginUsername: loginUsername
    property alias login_OK: login_OK
    Label {
        x: 40
        y: 43
        width: 128
        height: 49
        text: "用户登录"
        font.pixelSize: 50
        font.strikeout: false
        font.underline: false
        font.bold: true
        color: "#000000"
    }

    Rectangle {
        x: 40
        y: 143
        height: 606
        width: 800
        radius: 10
        color: "#DCDCDC"

        Label{
            x: 205
            y: 150
            width: 60
            height: 40
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "用户名:"
            color: "#000000"
        }

        MyTextField {
            id:loginUsername
            x: 290
            y: 150
            text: "root"
            placeholderText: "请输入用户名";
        }

        Label{
            x: 205
            y: 280
            width: 60
            height: 40
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "密    码:"
            color: "#000000"
        }

        MyTextField{
            id:passwd
            x: 290
            y: 280
            text: "123456"
            placeholderText: "请输入密码";
        }

        KeyButton {
            id: login_OK
            x: 280
            y: 420
            width: 200
            height: 70
            text: qsTr("登录")
//            chooseBtnBack.border.color: control.focus ? "#1E90FF" : "#000000"
        }
    }

}
