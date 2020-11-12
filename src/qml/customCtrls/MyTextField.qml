import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

TextField{
    id: control
    property alias recBorder: recBorder
    MyColors {
        id : m_color
    }

    font.family: "微软雅黑"
    color: m_color.text_input
    text: qsTr("")
    font.bold: false
    font.pixelSize: 24
    background: Rectangle {
        id: recBorder
        implicitWidth: 200
        implicitHeight: 50
        radius: 6
        border.color: control.focus ? "#1E90FF" : "#000000"
        border.width: 1
    }
}
