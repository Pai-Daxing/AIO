import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Popup {
    property alias popup_lab: popup_lab
    property alias popup_exit: popup_exit
    property alias popup_exit_text: popup_exit_text
    property alias popup_OK: popup_OK
    property alias popup_OK_text: popup_OK_text

    x: 390
    y: 275
    height: 250
    width: 500
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background: Rectangle {
        color: "#F8F8FF"
        radius: 10
    }

    Rectangle {
        x: -12
        y :170
        height: 2
        width: 500
        color: "#DCDCDC"
    }

    Rectangle {
        x: 237
        y :170
        height: 68
        width: 2
        color: "#DCDCDC"
    }

    Label{
        id: popup_lab
        x: -11
        y: 20
        width: 498
        height: 149
        font.pixelSize: 22
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }

//    Rectangle{
//        x: -12
//        y: 172
//        width: 249
//        height: 66
//        color: "#F8F8FF"
//    }

    Button {
        id: popup_exit
        x: -12
        y: 172
        width: 249
        height: 66
        background: RoundRectangle {
            color: parent.pressed ? "#DCDCDC" : "#F8F8FF"
            radius: 10
            radiusCorners: Qt.AlignLeft | Qt.AlignBottom
        }
        Text {
            id: popup_exit_text
            text: qsTr("取消")
            font.pixelSize: 24
            color: "#000000"
            anchors.centerIn: parent
        }
    }

    Button {
        id: popup_OK
        x: 239
        y: 172
        width: 249
        height: 66
        background: RoundRectangle {
            color: parent.pressed ? "#DCDCDC" : "#F8F8FF"
            radius: 10
            radiusCorners: Qt.AlignRight | Qt.AlignBottom
        }
        Text {
            id: popup_OK_text
            text: qsTr("确定")
            font.pixelSize: 24
            color: "#1E90FF"
            anchors.centerIn: parent
        }
    }
}
