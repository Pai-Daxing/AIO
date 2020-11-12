import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14

Item {
    id: update

    property alias update_Return: update_Return
    property alias update_OK: update_OK
    property alias updatelab: updatelab

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
        text: "版本更新"
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

        MyTextField {
            id: updatelab
            x: 100
            y: 70
            height: 300
            width: 600
            wrapMode: Text.Wrap
            text:""
            readOnly: true
        }

        KeyButton {
            id: update_OK
            x: 300
            y: 500
            width: 200
            height: 70
            text: qsTr("检测更新")
            chooseBtnBack.border.color: control.focus ? "#1E90FF" : "#000000"
        }
    }

    KeyButton {
        id: update_Return
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }
}
