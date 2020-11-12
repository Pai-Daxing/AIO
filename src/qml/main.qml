import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "customCtrls"
import mykeyboard 1.0
import UiAdaptor 1.0
ApplicationWindow {
    id:root
    visible: true
    width: 1280
    height: 800

    //        flags:qsTr("Qt::FramelessWindowHint")
    background:Rectangle{
        color: "#F8F8FF"
    }

    UiAdaptor {
        id: uiadaptor

        onUdiskRemove: {
            ima_udisk.visible=false
        }

        onUdiskAdd: {
            ima_udisk.visible=true
        }

        onSignalDoorClose: {
            newValue = 1 ? ima_door.source = "/res/closedoor.png" : ima_door.source = "/res/opendoor.png"
        }

        onSetCSS2StandBy: {
            ima_serial.visible = true
        }
    }

    Row{
        x: 1220
        y: 20
        height: 20
        width: 20
        spacing: 10
        layoutDirection: Qt.RightToLeft

        Image {
            id: ima_serial
            height: 20
            width: 20
            source: "/res/chuankou.png"// This is available in all editors.
            visible: false
        }

        Image {
            id: ima_door
            height: 20
            width: 20
            source: ""// This is available in all editors.
        }

        Image {
            id: ima_udisk
            height: 20
            width: 20
            source: "/res/Uremove.png"// This is available in all editors.
            visible: false
        }


    }



    AppPage {
        id:app
    }

    MyKeyboard{
        id:myKeyboard
    }

    //Load styles
    MyStyles {
        id: myStyles
    }

    Rectangle{
        id: keyboard
        visible: true
        width: 370
        height: 610
        radius: 10
        x: 872
        y:143
        color: "#565656"

        Keyboard{
            id: key
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
        }
    }

    onActiveFocusItemChanged: {
        if(myKeyboard.isInputType())
        {
            keyboard.visible = true;
        }
        else
        {
            keyboard.visible = false;
        }
    }

    Connections{
        target: myKeyboard
        onCloseKeyboard: {
            keyboard.visible = false
            app.forceActiveFocus()
        }
    }
}
