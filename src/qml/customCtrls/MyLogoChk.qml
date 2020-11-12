import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: control

    signal clicked()
    property alias imactb: imactb
    property alias gouzi: gouzi
    property string buttontext
    property bool checked: false
    property ExclusiveGroup exclusiveGroup: null
    property color textColor: "#00000000"
    color: "#F8F8FF"
    radius: 10
    border.width: 2
    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(control)
        }
    }

    onCheckedChanged: {
        checked ? control.border.color = "#1E90FF" : control.border.color ="#000000"// This is available in all editors.
        checked ? gouzi.source = "/res/checked.png" : gouzi.source = ""
    }

    MyColors {
        id : cs_color
    }

    width: 100
    height: 100
    Image{
        id: imactb
        anchors.fill: parent
        source: ""
    }

    Image {
        id: gouzi
        width: 14
        height: 14
        x: 6
        y: 6
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            control.clicked()
            checked = true
        }
    }
}
