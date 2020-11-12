import QtQuick 2.4
import UiAdaptor 1.0

EngineerForm {
    id: eng

    property alias listView: listView

    UiAdaptor {
        id: uiadaptor_eng

        //io量
        onSignalRamPumpBackzero: {
            zsbZero.currentIndex = newValue ? 1 : 0;
        }

        onSignalRamPumpTIP: {
            zsbTip.currentIndex = newValue ? 1 : 0;
        }
        onSignalPutWasteBox: {
            putWaster.currentIndex = newValue ? 1 : 0;
        }
        onSignalCloseWasteBox: {
            closeWaster.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh1PutRagent: {
            ch1PutRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh2PutRagent: {
            ch2PutRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh3PutRagent: {
            ch3PutRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh4PutRagent: {
            ch4PutRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh1CloseRagent: {
            ch1CloseRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh2CloseRagent: {
            ch2CloseRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh3CloseRagent: {
            ch3CloseRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalCh4CloseRagent: {
            ch4CloseRagent.currentIndex = newValue ? 1 : 0;
        }
        onSignalDoorClose: {
            door.currentIndex = newValue ? 1 : 0;
        }

    }

    cbbAxis.onCurrentIndexChanged: {
        if( cbbAxis.currentIndex == 0)
        {
            groupAxis.text = 0
            idAxis.text = 1
        }else if(cbbAxis.currentIndex == 1)
        {
            groupAxis.text = 0
            idAxis.text = 2
        }else
        {
            groupAxis.text = 0
            idAxis.text = 3
        }
    }

    axis_init.onClicked: {
        var axisin = new Array(1)
        axisin[0] = groupAxis.text
        axisin[1] = idAxis.text
        uiadaptor_eng.axisToInit(axisin)
        console.log("111")
    }

    axisSS.onCheckedChanged: {
        if(axisSS.checked == true)
        {
            var axis = new Array(4)
            axis[0] = groupAxis.text
            axis[1] = idAxis.text
            axis[2] = speedAxis.text
            axis[3] = localAxis.text
            axis[4] = axisClockwise.checked ? 1: 0
            uiadaptor_eng.axisToStart(axis)
            console.log(cbbAxis.currentIndex+1)
        }else if(axisSS.checked == false)
        {
            var axisst = new Array(1)
            axisst[0] = groupAxis.text
            axisst[1] = idAxis.text
            uiadaptor_eng.axisToStop(axisst)
        }
    }

    zsbss.onCheckedChanged: {
        if(zsbss.checked == true)
        {
            var zsb = new Array(2)
            zsb[0] = zsbSpeed.text
            zsb[1] = zsbStepNum.text
            zsb[2] = zsbClockwise.checked ? 1: 0
            uiadaptor_eng.zsbToStart(zsb)
        }else if(zsbss.checked == false)
            uiadaptor_eng.zsbToStop()
    }

    zsbinit.onClicked: {
        uiadaptor_eng.zsbToInit()
    }


    ListView{
        id: listView
        x: 50
        y: 143
        width: 200
        height: 480
        clip: true
        spacing :10

        highlight: Rectangle {
            width: listView.width
            height: 70
            color: "#1E90FF"
            radius: 10

            Behavior on y {
                SpringAnimation {
                    spring: 3
                    damping: 0.2
                }
            }
        }
        highlightFollowsCurrentItem: true
        focus: true
        delegate: Rectangle {
            width: listView.width
            height: 70
            radius: 10
            border.width:1
            property color tempcolor: "transparent"
            color: tempcolor

            Text {
                text: name
                anchors.centerIn: parent
                font.bold: false
                font.pixelSize: listView.currentIndex == index ? 26 : 22
            }

            MouseArea{
                id: listMouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    listView.currentIndex = index
                }

                onExited: {
                    tempcolor = "transparent"
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "三轴系统"
            }

            ListElement {
                name: "IO量"
            }

            ListElement {
                name: "离心机隔膜泵"
            }

            ListElement {
                name: "其他"
            }
        }
    }
}
