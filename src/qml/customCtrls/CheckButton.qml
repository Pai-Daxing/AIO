// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.1
import QtQuick.Controls 1.4

Rectangle{
    id: checkButton
    width: checkPic.width+checkText.width+5;
    height: checkText.height
    color: "#00000000"

    signal clicked()

    property string buttontext
    property bool checked: false
    property ExclusiveGroup exclusiveGroup: null
    property color textColor: "#00000000"
    property alias checkPic: checkPic

    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(checkButton)
        }
    }

    onCheckedChanged: {
        checked ? checkPic.source = "qrc:/res/icon_choose.png" : checkPic.source = "qrc:/res/icon_choose_not.png"
    }

    Image {
        id: checkPic
        width: 30; height: 30
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/res/icon_choose_not.png"
    }

    Text {
        id: checkText
        anchors.left: checkPic.right
        anchors.leftMargin: 3
        text: buttontext
        color: textColor

        font.pixelSize: 25
        font.family: "AR PL UKai CN"
        font.bold: true

        horizontalAlignment : Text.AlignHCenter ; verticalAlignment : Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            checkButton.clicked()
            checked = true
        }
    }
}
