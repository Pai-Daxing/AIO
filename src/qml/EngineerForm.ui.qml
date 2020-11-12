import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14

Item {
    width: 1280
    height: 5000
    property alias swiDpumpSuction: swiDpumpSuction

    property alias exit_engine: exit_engine

    property alias axisView: axisView
    property alias cbbAxis: cbbAxis
    property alias groupAxis: groupAxis
    property alias idAxis: idAxis
    property alias speedAxis: speedAxis
    property alias localAxis: localAxis
    property alias axisSS: axisSS
    property alias axis_init: axis_init
    property alias axisClockwise: axisClockwise

    property alias rgbSensor: rgbSensor

    property alias dpmPumpView: dpmPumpView
    property alias pumpSS: pumpSS
    property alias pumpCW: pumpCW
    property alias pumpSpeed: pumpSpeed
    property alias pumpTitleSpeed: pumpTitleSpeed
    property alias pumpStepSpeed: pumpStepSpeed
    property alias redCell: redCell
    property alias dentriDpm: dentriDpm
    property alias comboBoxCover: comboBoxCover
    property alias comboBox_Left: comboBox_Left
    property alias comboBox_Right: comboBox_Right
    property alias comboBoxBobble: comboBoxBobble
    property alias comboBoxBobble1: comboBoxBobble1
    property alias comboBoxLiquid: comboBoxLiquid
    property alias comboBoxDPM: comboBoxDPM
    property alias redColor: redColor
    property alias greenColor: greenColor
    property alias blueColor: blueColor
    property alias whiteBalance: whiteBalance
    property alias recColor: recColor

    property alias dPumpDpm: dPumpDpm
    property alias swiDpump: swiDpump
    property alias centrifugeRPM: centrifugeRPM
    property alias centrifugeStartTime: centrifugeStartTime
    property alias centrifugeStopTime: centrifugeStopTime
    property alias centrifugeForce: centrifugeForce
    property alias swiCentrifuge: swiCentrifuge
    property alias centrifugeSS: centrifugeSS

    property alias ioView: ioView
    property alias zsbZero: zsbZero
    property alias zsbTip: zsbTip
    property alias zsbSpeed: zsbSpeed
    property alias zsbStepNum: zsbStepNum
    property alias zsbClockwise: zsbClockwise
    property alias zsbss: zsbss
    property alias zsbinit: zsbinit
    property alias putWaster: putWaster
    property alias closeWaster: closeWaster
    property alias door: door
    property alias ch1PutRagent: ch1PutRagent
    property alias ch1CloseRagent: ch1CloseRagent
    property alias ch2PutRagent: ch2PutRagent
    property alias ch2CloseRagent: ch2CloseRagent
    property alias ch3PutRagent: ch3PutRagent
    property alias ch3CloseRagent: ch3CloseRagent
    property alias ch4PutRagent: ch4PutRagent
    property alias ch4CloseRagent: ch4CloseRagent

    Item {
        width: 1280
        height: 800

        Rectangle {
            width: 300
            height: 800
            color: "#DCDCDC"
            Label {
                x: 30
                y: 43
                width: 128
                height: 49
                text: "工程师模式"
                font.pixelSize: 50
                font.strikeout: false
                font.underline: false
                font.bold: false
                color: "#000000"
            }

            KeyButton {
                id: exit_engine
                x: 50
                y: 700
                width: 200
                height: 70
                text: "退出登录"
                btnIcon.source: ""
                //                chooseBtnBack.border.color: exit_engine.focus ? "#1E90FF" : "#000000"
            }
        }
    }

    Item {
        id: axisView
        x: 300
        y: 0
        width: 980
        height: 800
        visible: false

        CustomComboBox {
            id: cbbAxis
            x: 84
            y: 112
            width: 150
            height: 50
            model:["X轴", "Y轴", "Z轴"]
        }

        MyLabel {
            x: 84
            y: 250
            width: 60
            text: qsTr("顺时针")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: axisClockwise
            x: 150
            y: 255
        }

        MyLabel {
            x: 84
            y: 189
            width: 80
            height: 40
            text: "回零"
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            x: 84
            y: 324
            width: 80
            height: 40
            text: "组号:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: groupAxis
            x: 170
            y: 324
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: groupAxis.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 84
            y: 395
            width: 80
            height: 40
            text: "ID号:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: idAxis
            x: 170
            y: 395
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: idAxis.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 84
            y: 463
            width: 80
            height: 40
            text: "速度:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: speedAxis
            x: 170
            y: 463
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: speedAxis.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 84
            y: 533
            width: 80
            height: 40
            text: "步数:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: localAxis
            x: 170
            y: 533
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: localAxis.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 84
            y: 611
            width: 80
            height: 40
            text: "启停"
            font.bold: false
            font.pixelSize: 20
        }

        MySwitch {
            id: axisSS
            x: 170
            y: 616

        }

        KeyButton {
            id: axis_init
            x: 84
            y: 684
            width: 150
            height: 50
            text: "初始化"
            font.pixelSize: 22
            btnIcon.source: ""
            chooseBtnBack.border.color: axis_init.focus ? "#1E90FF" : "#000000"
        }

    }

    Item {
        id: rgbSensor
        x: 300
        y: 810
        width: 980
        height: 800
        visible: false

        MyLabel {
            x: 83
            y: 99
            width: 110
            text: qsTr("隔膜泵 ")
            font.bold: false
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }

        MyLabel {
            id: dPumpDpm
            x: 199
            y: 99
            width: 110
            text: qsTr("0")
            font.bold: false
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }

        MyLabel {
            x: 83
            y: 199
            width: 110
            text: qsTr("启动")
            font.bold: false
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }

        MySwitch {
            id: swiDpump
            x: 156
            y: 204
        }

        MyLabel {
            x: 83
            y: 153
            width: 110
            text: qsTr("吸气")
            font.bold: false
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }

        MySwitch {
            id: swiDpumpSuction
            x: 152
            y: 158
        }

        MyLabel {
            x: 83
            y: 278
            width: 196
            height: 40
            text: "离心机实时转速(rpm):"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            id: centrifugeRPM
            x: 280
            y: 278
            width: 80
            height: 40
            text: "0"
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            x: 83
            y: 342
            width: 80
            height: 40
            text: "离心机启动时间(s):"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: centrifugeStartTime
            x: 260
            y: 342
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: centrifugeStartTime.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 83
            y: 404
            width: 80
            height: 40
            text: "离心机停止时间(s):"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: centrifugeStopTime
            x: 260
            y: 404
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: centrifugeStopTime.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 83
            y: 463
            width: 80
            height: 40
            text: "离心力(g):"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: centrifugeForce
            x: 260
            y: 463
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: centrifugeForce.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 83
            y: 528
            width: 80
            height: 40
            text: "顺时针:"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MySwitch {
            id: swiCentrifuge
            x: 171
            y: 533
        }

        MyLabel {
            x: 83
            y: 593
            width: 80
            height: 40
            text: qsTr("启停:")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }

        MySwitch {
            id: centrifugeSS
            x: 171
            y: 598
        }

    }

    Item {
        id: dpmPumpView
        x: 300
        y: 1616
        width: 980
        height: 800
        visible: false

        MyLabel {
            x: 83
            y: 70
            width: 110
            text: qsTr("蠕动泵")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 24
            font.bold: false
        }

        MyLabel {
            id: pumpTitleSpeed
            x: 199
            y: 70
            width: 110
            text: qsTr("0")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.bold: false
        }

        MyLabel {
            x: 325
            y: 126
            width: 85
            height: 31
            text: qsTr("启停")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: pumpSS
            x: 429
            y: 126
        }

        MyLabel {
            x: 325
            y: 176
            width: 85
            height: 40
            text: qsTr("顺时针")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: pumpCW
            x: 429
            y: 181
        }

        MyLabel {
            x: 83
            y: 121
            width: 80
            height: 40
            text: "设置速度:"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: pumpSpeed
            x: 187
            y: 121
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: pumpSpeed.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 83
            y: 176
            width: 80
            height: 40
            text: "设置步数:"
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: pumpStepSpeed
            x: 187
            y: 176
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: pumpStepSpeed.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 83
            y: 248
            width: 110
            text: qsTr("红细胞")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            id:redCell
            x: 157
            y: 248
            width: 110
            text: qsTr("0")
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            x: 293
            y: 248
            width: 110
            text: qsTr("离心桶 ")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            id:dentriDpm
            x: 363
            y: 248
            width: 110
            text: qsTr("0")
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.pixelSize: 20
        }

        MyLabel {
            x: 83
            y: 322
            width: 110
            text: qsTr("整个盖子")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        CustomComboBox {
            id: comboBoxCover
            x: 207
            y: 322
            width: 100
            height: 40
            enabled: false
            model: [qsTr("关闭"), qsTr("打开")]
        }

        MyLabel {
            x: 83
            y: 380
            width: 110
            text: qsTr("左半边盖子")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        CustomComboBox {
            id: comboBox_Left
            x: 207
            y: 380
            width: 100
            height: 40
            enabled: false
            model: [qsTr("关闭"), qsTr("打开")]
        }


        MyLabel {
            x: 83
            y: 438
            width: 110
            text: qsTr("右半边盖子")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        CustomComboBox {
            id: comboBox_Right
            x: 207
            y: 438
            width: 100
            height: 40
            enabled: false
            model: [qsTr("关闭"), qsTr("打开")]
        }


        MyLabel {
            x: 298
            y: 509
            width: 80
            text: qsTr("空探2")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        CustomComboBox {
            id: comboBoxBobble
            x: 386
            y: 509
            width: 87
            height: 40
            enabled: false
            model: [qsTr("空气"), qsTr("液体")]
        }

        MyLabel {
            x: 82
            y: 509
            width: 80
            height: 40
            text: qsTr("空探1")
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pixelSize: 20
        }

        CustomComboBox {
            id: comboBoxBobble1
            x: 169
            y: 509
            width: 87
            height: 40
            enabled: false
            model: [qsTr("空气"), qsTr("液体")]
        }

        MyLabel {
            x: 82
            y: 563
            width: 110
            text: qsTr("漏液")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }

        CustomComboBox {
            id: comboBoxLiquid
            x: 169
            y: 563
            width: 87
            height: 40
            enabled: false
            model: [qsTr("未漏液"), qsTr("漏液")]
        }

        MyLabel {
            x: 299
            y: 563
            width: 110
            text: qsTr("DPM")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }

        CustomComboBox {
            id: comboBoxDPM
            x: 386
            y: 563
            width: 87
            height: 40
            enabled: false
            model: [qsTr("未安装"), qsTr("已安装")]
        }

        MyLabel {
            x: 83
            y: 621
            width: 110
            text: qsTr("颜色传感器")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 24
            font.bold: false
        }

        MyLabel {
            id: redColor
            x: 207
            y: 621
            width: 120
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.bold: false
        }

        MyLabel {
            id: greenColor
            x: 282
            y: 621
            width: 120
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.bold: false
        }

        MyLabel {
            id: blueColor
            x: 358
            y: 621
            width: 120
            height: 40
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.pixelSize: 20
        }

        Rectangle {
            id: recColor
            x: 420
            y: 614
            height: 40
            width: 40
            visible: false
        }

        MyLabel {
            x: 83
            y: 681
            width: 110
            text: qsTr("白平衡测试")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: whiteBalance
            x: 207
            y: 686
        }
    }

    Item {
        id: ioView
        x: 300
        y: 2416
        width: 980
        height: 800
        visible: false

        MyLabel {
            x: 80
            y: 63
            width: 110
            text: qsTr("柱塞泵")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: zsbZero
            x: 210
            y: 65
            width: 100
            height: 40
            enabled: false
            model: [qsTr("未回零"), qsTr("回零")]
        }

        CustomComboBox {
            id: zsbTip
            x: 330
            y: 65
            width: 100
            height: 40
            enabled: false
            model: [qsTr("无TIP"), qsTr("有TIP")]
        }

        MyLabel {
            x: 210
            y: 123
            width: 80
            height: 40
            text: "速度:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: zsbSpeed
            x: 296
            y: 123
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: zsbSpeed.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 210
            y: 181
            width: 80
            height: 40
            text: "步数:"
            font.bold: false
            font.pixelSize: 20
        }

        MyTextField {
            id: zsbStepNum
            x: 296
            y: 181
            width: 120
            height: 40
            font.pixelSize: 20
            recBorder.border.color: zsbStepNum.focus ? "#1E90FF" : "#000000"
            recBorder.border.width: 1
        }

        MyLabel {
            x: 210
            y: 237
            width: 60
            text: qsTr("顺时针")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: zsbClockwise
            x: 276
            y: 242
        }

        MyLabel {
            x: 210
            y: 283
            width: 60
            text: qsTr("启停")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.bold: false
        }
        MySwitch {
            id: zsbss
            x: 276
            y: 288
        }

        KeyButton {
            id: zsbinit
            x: 210
            y: 336
            width: 150
            height: 50
            text: "初始化"
            font.pixelSize: 22
            btnIcon.source: ""
            chooseBtnBack.border.color: zsbinit.focus ? "#1E90FF" : "#000000"
        }


        MyLabel {
            x: 80
            y: 413
            width: 110
            text: qsTr("废料盒")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: putWaster
            x: 210
            y: 413
            width: 100
            height: 40
            enabled: false
            model: [qsTr("未放置"), qsTr("放置")]
        }

        CustomComboBox {
            id: closeWaster
            x: 330
            y: 413
            width: 100
            height: 40
            enabled: false
            model: [qsTr("未关闭"), qsTr("关闭")]
        }

        MyLabel {
            x: 80
            y: 473
            width: 110
            text: qsTr("仓门")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: door
            x: 210
            y: 473
            width: 100
            height: 40
            enabled: false
            model: [qsTr("未关闭"), qsTr("已关闭")]
        }

        MyLabel {
            x: 80
            y: 533
            width: 110
            text: qsTr("通道1")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: ch1PutRagent
            x: 210
            y: 533
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未发现试剂"), qsTr("发现试剂")]
        }

        CustomComboBox {
            id: ch1CloseRagent
            x: 430
            y: 533
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未关闭试剂盖"), qsTr("已关闭试剂盖")]
        }

        MyLabel {
            x: 80
            y: 593
            width: 110
            text: qsTr("通道2")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: ch2PutRagent
            x: 210
            y: 593
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未发现试剂"), qsTr("发现试剂")]
        }

        CustomComboBox {
            id: ch2CloseRagent
            x: 430
            y: 593
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未关闭试剂盖"), qsTr("已关闭试剂盖")]
        }

        MyLabel {
            x: 80
            y: 653
            width: 110
            text: qsTr("通道3")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: ch3PutRagent
            x: 210
            y: 653
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未发现试剂"), qsTr("发现试剂")]
        }

        CustomComboBox {
            id: ch3CloseRagent
            x: 430
            y: 653
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未关闭试剂盖"), qsTr("已关闭试剂盖")]
        }

        MyLabel {
            x: 80
            y: 713
            width: 110
            text: qsTr("通道4")
            font.pixelSize: 24
            font.bold: false
        }

        CustomComboBox {
            id: ch4PutRagent
            x: 210
            y: 713
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未发现试剂"), qsTr("发现试剂")]
        }

        CustomComboBox {
            id: ch4CloseRagent
            x: 430
            y: 713
            width: 200
            height: 40
            enabled: false
            model: [qsTr("未关闭试剂盖"), qsTr("已关闭试剂盖")]
        }
    }
}
