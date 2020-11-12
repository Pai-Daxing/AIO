import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

import QtQml 2.2

Item{
    id:keyboard
    property alias pinyin: pinyin
    width:360
    height:480
    focus:false

    GridView{
        id: listModel
        anchors.fill: parent
        cellHeight: 120
        cellWidth: 120
        model: myKeyboard.getKeyModel()

        delegate: Button {
            width: 120
            height:120
            style: myStyles.toolButtonStyle
            text: modelData
            onClicked:{
                var str = pinyin.text;

                if(!myKeyboard.isChineseInput())
                    myKeyboard.simulateKeyPressEvent(modelData, str);
                else{
                        str = myKeyboard.simulateKeyPressEvent(modelData, str);
                        pinyin.text = str;
                }
            }
        }

        Component.onCompleted: {
            myKeyboard.setFullKeyboardFlag(true);
        }
    }

    RowLayout {
        id: chineseRow
        visible: false
        anchors.bottom: listModel.top
        anchors.bottomMargin: -50
        width: parent.width
        height: parent.height

        Rectangle {
            id: pinyinRec
            width: 90
            height: 90
            visible: true
            color: "#464647"
            border.color: "gray"
            radius: 5
            anchors.left: parent.left
            anchors.leftMargin: 0
            Text {
                id: pinyin
                text: ""
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 30
                //horizontalAlignment: Text.AlignHCenter
                //verticalAlignment: Text.AlignVCenter
                onTextChanged: chineseSelector.model = myKeyboard.getChineseSelectorModel()
            }
        }

        ListView{
            id: chineseSelector
            width: 300
            height: 100
            anchors.left: pinyinRec.right
            anchors.leftMargin: 5
            orientation: ListView.Horizontal
            spacing: 0
            model: myKeyboard.getChineseSelectorModel()
            delegate: Button {
                width: 100
                height:100
                style: myStyles.toolButtonStyle
                text: modelData
                onClicked:{

                    if( modelData != "<<" && modelData != ">>"){
                        myKeyboard.chineseSelector(modelData);
                        pinyin.text = "";
                    }
                    else
                        chineseSelector.model = myKeyboard.turnPageChinese(modelData);
                }
            }

        }

    }


    Connections{
        target: myKeyboard
        onKeyModelChanged: {

            if(true){
                listModel.anchors.bottomMargin = -155;
                chineseRow.anchors.bottomMargin = -145;
                keyboard.height = 400;
            }
            else{
                listModel.anchors.bottomMargin = 0;
                chineseRow.anchors.bottomMargin = 0;
                keyboard.height = 400;
            }

            if(myKeyboard.isChineseInput())
                chineseRow.visible = true;
            else
                chineseRow.visible = false;

            listModel.model = myKeyboard.getKeyModel();
            //console.log("KeysNum = "+myKeyboard.getKeysNumber());
        }
    }

    //Behavior on x { SmoothedAnimation { velocity: 1300 } }
    //Behavior on y { SmoothedAnimation { velocity: 10} }
}

