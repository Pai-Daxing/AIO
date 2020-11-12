import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    width: 800
    height: 1280

    property alias writeNext: writeNext

    Label {
        x: 40
        y: 43
        width: 128
        height: 49
        text: qsTr("数据写入")
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

        Label {
            x: 336
            y: 490
            width: 128
            height: 49
            text: qsTr("警告!\n数据正在写入\n待完成后退出")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 26
            font.strikeout: false
            font.underline: false
            font.bold: false
            color: "#000000"
        }
    }

    KeyButton {
        id: writeNext
        x: 1040
        y: 143
        width: 200
        height: 70
        text: qsTr("退出")
        btnIcon.source: "/res/next.png"
        chooseBtnBack.color: "#1E90FF"
    }
}
