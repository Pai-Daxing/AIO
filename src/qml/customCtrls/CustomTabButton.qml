import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: control

    signal clicked()
    property alias labctb: labctb
    property string buttontext
    property bool checked: false
    property ExclusiveGroup exclusiveGroup: null
    property color textColor: "#00000000"
    color: "#F8F8FF"
//    color: "#D3D3D3"

    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(control)
        }
    }

    onCheckedChanged: {
        checked ? labctb.color = "#1E90FF" : labctb.color ="#000000"
        checked ? control.opacity = 0.5 : control.opacity = 1
//        checked ? control.scale = 1.2 : control.scale = 1
    }


    MyColors {
        id : cs_color
    }

    width: 180
    height: 70
    MyLabel{
        id: labctb
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: ""
        font.bold: false
        scale: control.checked ? 1.2 : 1
//        font.pixelSize: 24
        color: "#000000"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked:  {
            control.clicked()
            checked = true
        }

        onPressed: {
            control.opacity = 0.5
        }
    }
}
