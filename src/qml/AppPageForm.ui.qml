import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14
import CustomPlotPressure 1.0

Item {
    width: 1280
    height: 5000
    property alias selfTestView: selfTestView
    property alias startSelf: startSelf
    property alias adminLogin: adminLogin
    property alias selftestlab: selftestlab
    property alias listviewST: listviewST
    property alias listmodel: listmodel

    property alias mainView: mainView
    property alias mainSet: mainSet
    property alias exitLogin: exitLogin
    property alias main_permiss: main_permiss
    property alias main_name: main_name
    property alias ch1: ch1
    property alias ch2: ch2
    property alias ch3: ch3
    property alias ch4: ch4
    property alias chRun: chRun

    property alias set_main: set_main
    property alias set_Return: set_Return
    property alias set_Infor: set_Infor
    property alias set_WIFI: set_WIFI
    property alias set_Query: set_Query
    property alias set_user: set_user
    property alias set_Data: set_Data
    property alias set_Update: set_Update
    property alias set_changepwd: set_changepwd
    property alias set_alarm: set_alarm
    property alias set_newTech: set_newTech

    property alias experimentView: experimentView
    //    property alias experimentNext: experimentNext
    property alias experimentReturn: experimentReturn
    property alias experimentDel: experimentDel
    property alias experimentADD: experimentADD
    property alias projectName: projectName
    property alias cbbStep: cbbStep
    property alias fetchHole: fetchHole
    property alias rHole: rHole
    property alias moveWaterV: moveWaterV
    property alias mixNum: mixNum
    property alias replaceTIP: replaceTIP

    property alias chEditorView: chEditorView
    property alias operator: operator
    property alias currentCH: currentCH
    property alias sampleID: sampleID
    property alias detectiontech: detectiontech
    property alias installComsum: installComsum
    property alias apply: apply
    property alias applyAll: applyAll
    property alias cheditorreturn: cheditorreturn

    property alias chRunView: chRunView
    property alias runCurrentUser: runCurrentUser
    property alias runID: runID
    property alias runTech: runTech
    property alias runCurrentStatus: runCurrentStatus
    property alias runEndTime: runEndTime
    property alias chRunText: chRunText
    property alias chRunReturn: chRunReturn
    property alias cancle: cancle

    Item {
        id: selfTestView
        width: 1280
        height: 800

        MyLabel{
            x: 40
            y: 43
            width: 200
            text: "设备自检"
            font.bold: true
            font.pixelSize: 48
        }

        Frame {
            x: 40
            y: 125
            height: 500
            width: 580
            background: Rectangle {
                height: 500
                anchors.fill: parent
                color: "#DCDCDC"
                radius: 10
            }

            MySelfLabel {
                id: weightSM
                myText.text: "三轴模块"
            }

            MySelfLabel {
                id: cockSM
                y: 70
                myText.text: "柱塞泵模块"
            }

            MySelfLabel {
                id: liquidSM
                y: 140
                myText.text: ""
            }

            MySelfLabel {
                id: peristalticSM
                y: 210
                myText.text: ""
            }

            MySelfLabel {
                id: colorSM
                y: 280
                myText.text: ""
            }

            MySelfLabel {
                id: dpmSM
                y: 350
                myText.text: ""
            }

            MySelfLabel {
                id: centrifugeSM
                y: 420
                myText.text: ""
            }
        }

        Frame {
            x: 660
            y: 125
            height: 500
            width: 580
            background: Rectangle {
                anchors.fill: parent
                color: "#DCDCDC"
                radius: 10
            }

            MyLabel{
                id: selftestlab
                x: 10
                y: 13
                width: 200
                text: "等待设备自检"
                color: "#1E90FF"
                horizontalAlignment: Text.AlignLeft
                font.bold: false
                font.pixelSize: 26
            }
            Rectangle{
                x: 28
                y: 70
                height: 388
                width: 500

                ListView {
                    id: listviewST
                    anchors.fill: parent
                    clip:true
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    spacing: 10
                    model:ListModel {
                        id: listmodel
                    }
                    ScrollBar.vertical: ScrollBar { }
                }
            }
        }

        KeyButton {
            id: startSelf
            x: 230
            y: 668
            height: 70
            width: 200
            text: "开始自检"
            btnIcon.source: ""
        }

        KeyButton {
            id: adminLogin
            x: 850
            y: 668
            height: 70
            width: 200
            text: "用户登录"
            btnIcon.source: ""
        }

    }

    Item {
        id: mainView
        x: 0
        y: 817
        width: 1280
        height: 800

        Image {
            x: 34
            y: 15
            width: 194
            height: 55
            source: "/res/logo.png"
        }

        KeyButton {
            id:mainSet
            x: 1040
            y: 679
            height: 70
            width: 200
            text: "系统设置"
            btnIcon.source: "/res/setting.png"
        }

        KeyButton {
            id:chRun
            property int status: 0
            x: 1040
            y: 583
            height: 70
            width: 200
            text: "运行"
            btnIcon.source: "/res/experiment.png"
        }

        MyLabel {
            x: 1056
            y: 151
            height: 45
            width: 87
            text: "用户名:  "
            font.bold: false
            font.pixelSize: 22
            horizontalAlignment: Text.AlignRight
        }

        MyLabel {
            id: main_name
            x: 1149
            y: 151
            height: 45
            width: 117
            text: ""
            font.bold: false
            font.pixelSize: 22
            horizontalAlignment: Text.AlignLeft
        }

        MyLabel {
            x: 1056
            y: 195
            height: 45
            width: 87
            text: "权   限:  "
            font.bold: false
            font.pixelSize: 22
            horizontalAlignment: Text.AlignRight
        }

        MyLabel {
            id: main_permiss
            x: 1149
            y: 195
            height: 45
            width: 117
            text: ""
            font.bold: false
            font.pixelSize: 22
            horizontalAlignment: Text.AlignLeft
        }

        KeyButton {
            id:exitLogin
            x: 1090
            y: 263
            height: 50
            width: 150
            text: "退出登录"
            btnIcon.source: ""// This is available in all editors.
        }

        //        KeyButton {
        //            x: 1090
        //            y: 334
        //            height: 50
        //            width: 150
        //            text: "休眠"
        //            btnIcon.source: ""// This is available in all editors.
        //        }

        Rectangle {
            x: 34
            y: 166
            width: 860
            height: 583
            radius: 10
            border.width: 2
            border.color: "#000000"
            color: "#F8F8FF"

            CustomButton {
                id: ch1
                x: 87
                y: 60
                width: 300
                height: 200
                chtext.text: "通道一"
                statustext.text: "空闲"
                timetext.text: "0"+" min"
                protext.text: "NA"
                statusRec.color: "#F5F5F5"
            }

            CustomButton {
                id: ch2
                x: 483
                y: 60
                width: 300
                height: 200
                chtext.text: "通道二"
                statustext.text: "空闲"
                timetext.text: "0"+" min"
                protext.text: "NA"
                statusRec.color: "#F5F5F5"
            }

            CustomButton {
                id: ch3
                x: 87
                y: 320
                width: 300
                height: 200
                chtext.text: "通道三"
                statustext.text: "空闲"
                timetext.text: "78"+" min"
                protext.text: "NA"
                statusRec.color: "#F5F5F5"
            }

            CustomButton {
                id: ch4
                x: 483
                y: 320
                width: 300
                height: 200
                chtext.text: "通道四"
                statustext.text: "空闲"
                timetext.text: "78"+" min"
                protext.text: "NA"
                statusRec.color: "#F5F5F5"
            }
        }

    }

    Item {
        id: set_main
        x: 0
        y: 1635
        width: 1280
        height: 800
        visible: true

        Label {
            x: 40
            y: 43
            width: 128
            height: 49
            text: "系统设置"
            font.strikeout: false
            font.underline: false
            font.bold: true
            font.pixelSize: 50
            color: "#000000"
        }

        CustIconButton {
            id: set_Infor
            x: 936
            y: 208
            text: "出厂信息"
            btnIcon.source: "/res/information.png"
        }

        CustIconButton {
            id: set_WIFI
            x: 436
            y: 470
            text: "无线连接"
            btnIcon.source: "/res/wifilogo.png"
        }

        CustIconButton {
            id: set_alarm
            x: 696
            y: 470
            text: "报警日志"
            btnIcon.source: "/res/alarm.png"
        }

        CustIconButton {
            id: set_newTech
            x: 936
            y: 470
            text: "新建工艺"
            btnIcon.source: "/res/experiment.png"
        }

        CustIconButton {
            id: set_Query
            x: 186
            y: 470
            text: "查询工艺"
            bottomPadding: 7
            btnIcon.source: "/res/configuration.png"
        }

        CustIconButton {
            id: set_user
            x: 436
            y: 208
            text: "用户设置"
            btnIcon.source: "/res/Administrator.png"
        }

        CustIconButton {
            id: set_changepwd
            x: 436
            y: 208
            text: "密码修改"
            btnIcon.source: "/res/changepasswd.png"
        }

        CustIconButton {
            id: set_Data
            x: 186
            y: 208
            text: "数据导出"
            btnIcon.source: "/res/PDF.png"
        }

        CustIconButton {
            id: set_Update
            x: 696
            y: 208
            text: "版本更新"
            btnIcon.source: "/res/update.png"
        }

        KeyButton {
            id: set_Return
            x: 1040
            y: 679
            width: 200
            height: 70
            text: "返回"
            btnIcon.source: "/res/last.png"
        }
    }

    Item {
        id: experimentView
        x: 0
        y: 2462
        width: 1280
        height: 800

        Label {
            x: 40
            y: 43
            width: 128
            height: 49
            text: "新建工艺"
            font.strikeout: false
            font.underline: false
            font.bold: true
            font.pixelSize: 50
            color: "#000000"
        }

        Rectangle {
            x: 40
            y: 143
            height: 606
            width: 950
            radius: 10
            color: "#DCDCDC"

            Label{
                x: 35
                y: 42
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "工艺名称"
                color: "#000000"
            }

            MyTextField {
                id:projectName
                x: 185
                y: 37
                width: 150
                text: ""
                horizontalAlignment: Text.AlignLeft
                placeholderText: "请输入工艺名称";
            }

            Label{
                x: 35
                y: 122
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "步骤"
                color: "#000000"
            }

            ComboBox {
                id: cbbStep
                x: 185
                y: 117
                width: 150
                height: 50
                model:["1", "2", "3", "4", "5", "6", "7", "8", "9"]
                font.pixelSize: 24
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }

            Label{
                x: 35
                y: 202
                width: 78
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "取物孔"
                color: "#000000"
            }

            ComboBox {
                id: fetchHole
                x: 185
                y: 197
                width: 150
                height: 50
                model:["样本孔", "1", "2", "3", "4", "5", "6", "7", "8"]
                font.pixelSize: 24
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }

            Label{
                x: 35
                y: 282
                width: 87
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "置物孔"
                color: "#000000"
            }

            ComboBox {
                id: rHole
                x: 185
                y: 277
                width: 150
                height: 50
                model:["PCR孔", "1", "2", "3", "4", "5", "6", "7", "8"]
                font.pixelSize: 24
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }

            Label{
                x: 35
                y: 362
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "移液量(μL)"
                color: "#000000"
            }

            MyTextField {
                id:moveWaterV
                x: 185
                y: 357
                width: 150
                text: ""
                horizontalAlignment: Text.AlignLeft
                placeholderText: "请输入移液量";
            }

            Label{
                x: 35
                y: 442
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "混合次数"
                color: "#000000"
            }

            MyTextField {
                id:mixNum
                x: 185
                y: 437
                width: 150
                text: ""
                horizontalAlignment: Text.AlignLeft
                placeholderText: "请输入混合次数";
            }

            Label{
                x: 35
                y: 522
                width: 113
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "更换TIP头"
                color: "#000000"
            }

            ComboBox {
                id: replaceTIP
                x: 185
                y: 517
                width: 150
                height: 50
                model:["否", "是"]
                font.pixelSize: 24
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }
        }


        KeyButton {
            id: experimentDel
            x: 1040
            y: 579
            width: 200
            height: 70
            text: qsTr("删除")
            btnIcon.source: "/res/last.png"
        }

        KeyButton {
            id: experimentADD
            x: 1040
            y: 479
            width: 200
            height: 70
            text: qsTr("更新")
            btnIcon.source: "/res/last.png"
        }

        //        KeyButton {
        //            id: experimentNext
        //            x: 1040
        //            y: 143
        //            width: 200
        //            height: 70
        //            text: qsTr("下一步")
        //            btnIcon.source: "/res/next.png"
        //            chooseBtnBack.color: "#1E90FF"
        //        }

        KeyButton {
            id: experimentReturn
            x: 1040
            y: 679
            width: 200
            height: 70
            text: qsTr("返回")
            btnIcon.source: "/res/last.png"
        }
    }
    Item {
        id: chEditorView
        x: 0
        y: 3262
        width: 1280
        height: 800

        Label {
            x: 40
            y: 43
            width: 128
            height: 49
            text: "通道编辑"
            font.strikeout: false
            font.underline: false
            font.bold: true
            font.pixelSize: 50
            color: "#000000"
        }

        Rectangle {
            x: 40
            y: 143
            height: 606
            width: 800
            radius: 3
            color: "#DCDCDC"

            Label{
                x: 35
                y: 42
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "操作者"
                color: "#000000"
            }

            MyTextField {
                id:operator
                x: 214
                y: 37
                width: 200
                text: ""
                horizontalAlignment: Text.AlignLeft
                readOnly: true
            }

            Label{
                x: 35
                y: 122
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "当前通道"
                color: "#000000"
            }

            MyTextField {
                id:currentCH
                x: 214
                y: 117
                width: 200
                text: ""
                horizontalAlignment: Text.AlignLeft
                readOnly: true
            }

            Label{
                x: 35
                y: 202
                width: 65
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "样本ID"
                color: "#000000"
            }

            MyTextField {
                id:sampleID
                x: 214
                y: 197
                width: 200
                text: ""
                horizontalAlignment: Text.AlignLeft
                placeholderText: "请输入样本编号";
            }

            Label{
                x: 35
                y: 282
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "检测工艺"
                color: "#000000"
            }

            ComboBox {
                id: detectiontech
                x: 214
                y: 277
                width: 200
                height: 50
                font.pixelSize: 24
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }

            Label{
                x: 35
                y: 362
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "耗材是否安装"
                color: "#000000"
            }

            ComboBox {
                id: installComsum
                x: 214
                y: 357
                width: 200
                height: 50
                model:["否","是"]
                font.pixelSize: 24
                enabled: false
                background: Rectangle{
                    anchors.fill: parent
                    radius: 5
                    border.color: "#000000"
                }
            }

        }

        KeyButton {
            id: applyAll
            x: 1040
            y: 480
            width: 200
            height: 70
            text: qsTr("应用所有通道")
            btnIcon.source: ""
        }

        KeyButton {
            id: apply
            x: 1040
            y: 580
            width: 200
            height: 70
            text: qsTr("应用")
            btnIcon.source: ""
        }

        KeyButton {
            id: cheditorreturn
            x: 1040
            y: 680
            width: 200
            height: 70
            text: qsTr("返回")
            btnIcon.source: "/res/last.png"
        }


    }

    Item {
        id: chRunView
        x: 0
        y: 4062
        width: 1280
        height: 800

        Label {
            x: 40
            y: 43
            width: 128
            height: 49
            text: "运行 | "
            font.strikeout: false
            font.underline: false
            font.bold: true
            font.pixelSize: 50
            color: "#000000"
        }

        Label {
            id: chRunText
            x: 184
            y: 65
            width: 128
            height: 49
            text: ""
            verticalAlignment: Text.AlignVCenter
            font.strikeout: false
            font.underline: false
            font.bold: false
            font.pixelSize: 30
            color: "#000000"
        }


        Rectangle {
            x: 40
            y: 143
            height: 606
            width: 968
            radius: 3
            color: "#DCDCDC"

            Rectangle {
                x: 483
                y: 10
                height: 586
                width: 2
                radius: 3
                color: "#F5F5F5"
            }

            Label{
                x: 35
                y: 60
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "当前用户："
                color: "#000000"
            }

            Label{
                id:runCurrentUser
                x: 176
                y: 60
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: ""
                color: "#000000"
            }

            Label{
                x: 35
                y: 150
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "样本ID："
                color: "#000000"
            }

            Label{
                id:runID
                x: 176
                y: 150
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: ""
                color: "#000000"
            }

            Label{
                x: 35
                y: 240
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "检测工艺："
                color: "#000000"
            }

            Label{
                id:runTech
                x: 176
                y: 240
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: ""
                color: "#000000"
            }

            Label{
                x: 35
                y: 330
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "当前状态："
                color: "#000000"
            }

            Label{
                id:runCurrentStatus
                x: 176
                y: 330
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: ""
                color: "#000000"
            }

            Label{
                x: 35
                y: 420
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: "剩余时间："
                color: "#000000"
            }

            Label{
                id:runEndTime
                x: 176
                y: 420
                width: 53
                height: 40
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: ""
                color: "#000000"
            }

            ///////////////折线图/////////////////
            CustomPlotPressure {
                id: chartPressure
                x: 530
                y: 60
                width: 400
                height: 500
            }
        }
        KeyButton {
            id: cancle
            x: 1040
            y: 600
            width: 200
            height: 70
            text: qsTr("取消")
           // btnIcon.source: "/res/last.png"
        }

        KeyButton {
            id: chRunReturn
            x: 1040
            y: 679
            width: 200
            height: 70
            text: qsTr("返回")
            btnIcon.source: "/res/last.png"
        }
    }
}
