import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Label{
    id: control
    text: qsTr("text")

    font.family: "微软雅黑"

    width: 110
    height: 40
    font.bold: true
    color: "#000000"
    horizontalAlignment: Text.AlignHCenter
    font.pixelSize: 26
    verticalAlignment: Text.AlignVCenter
}
