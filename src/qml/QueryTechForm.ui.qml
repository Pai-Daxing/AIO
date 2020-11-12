import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14

Item {
    width: 1280
    height: 800

    property alias queryTechReturn: queryTechReturn
    property alias queryTechCbb: queryTechCbb
    property alias queryTechKB: queryTechKB
    property alias queryAll: queryAll
    property alias delTechKB: delTechKB

    Label {
        x: 40
        y: 43
        width: 128
        height: 49
        text: "系统设置 |"
        font.pixelSize: 50
        font.strikeout: false
        font.underline: false
        font.bold: true
        color: "#000000"
    }

    Label {
        x: 289
        y: 70
        width: 177
        height: 32
        text: "查询工艺"
        color: "#000000"
        font.pixelSize: 28
    }

    Rectangle {
        x: 40
        y: 143
        height: 606
        width: 950
        radius: 5
        color: "#DCDCDC"
    }


    CustomComboBox {
        id: queryTechCbb
        x: 1040
        y: 143
        width: 200
        height: 50
    }

    KeyButton {
        id: queryTechKB
        x: 1040
        y: 243
        width: 200
        height: 70
        text: "查询"
        btnIcon.source: ""
    }

    KeyButton {
        id: delTechKB
        x: 1040
        y: 343
        width: 200
        height: 70
        text: "删除"
        btnIcon.source: ""
    }

    KeyButton {
        id: queryAll
        x: 1040
        y: 443
        width: 200
        height: 70
        text: "显示所有"
        btnIcon.source: ""
    }

    KeyButton {
        id: queryTechReturn
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }

}
