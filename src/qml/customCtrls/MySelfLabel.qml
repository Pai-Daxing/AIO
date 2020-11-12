import QtQuick 2.0

Rectangle {
    id: control
    height: 70
    width: 550
    color: "#DCDCDC"
    radius: 20
    property alias myText: myText
    property alias btnIcon: btnIcon
    property alias btnLoad: btnLoad
    Image {
        id : btnIcon
        opacity: control.down ? 0.5 : 1.0

        anchors.verticalCenter: control.verticalCenter
        x:10

        source: "/res/selfWait.png"
        sourceSize.width: 20
        sourceSize.height: 20
    }

    Loading{
        id: btnLoad
        x:12
        anchors.verticalCenter: control.verticalCenter
        visible: false
    }
    MyLabel{
        id: myText
        width: 500
        x:45
        anchors.top: control.top
        anchors.topMargin: 15
        font.pixelSize: 30
        color: "#000000"
        font.bold: false
        elide: Text.ElideLeft
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }

}
