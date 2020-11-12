import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "customCtrls"
import mykeyboard 1.0
ApplicationWindow {
    id:root
    visible: true
    width: 1280
    height: 800

    flags:qsTr("Qt::FramelessWindowHint")
//    background:Image{
//        source: "/res/pics/bg.png"
//    }
    background:Rectangle{
        color: "#464646"
    }

    header:UpperView{
        id:upperView
        width: parent.width
    }
    AppView {
        id:appView
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
        width: 400
        height: 240
        radius: 8
        x: 880
        y:280

        color: "#464646"

        Keyboard{
            id: key
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

    }

    onActiveFocusItemChanged: {
//        console.log("isInputType = " + myKeyboard.isInputType());

        if(myKeyboard.isInputType())
        {
            keyboard.visible = true;
            /*if(keyboard.x == -1200)
            {
                keyboard.x = keyboard.x + 1200;
                //keyboard.y = keyboard.y + 50;
            }
            */
        }
        else
        {
            /*if(keyboard.x == 0)
            {
                keyboard.x = keyboard.x - 1200;
                //keyboard.y = keyboard.y - 50;
            }
            */
            keyboard.visible = false;
        }
    }

    Connections{
        target: myKeyboard
        onCloseKeyboard: keyboard.visible = false
    }
}
