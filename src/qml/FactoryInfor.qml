import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14

Item {
    id: infor

    property alias messset_Return: messset_Return

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
        text: "出厂信息"
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

        Column {
            x:50
            y: 30
            spacing: 30

            MyLabel {
                text:"设备名称:  核酸提取荧光定量一体机 "
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }

            MyLabel {
                text: "设备编号:  Blood_Auto-NAE-PCR"
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }

            MyLabel {
                text: "运行系统:  Linux-4.14.24"
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }

            MyLabel {
                text: "系统版本:  V0.0.01"
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }

            MyLabel {
                text: "生产厂家:  江苏伯纳德生物科技发展有限公司"
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }
        }
    }

    KeyButton {
        id: messset_Return
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }
}
