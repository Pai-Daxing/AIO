//import QtQuick 2.6
//  import QtQuick.Controls 2.0

//  Switch {
//      id: control
//      text: qsTr("Switch")

//      font.pixelSize: 22
//      font.family: "微软雅黑"

//      contentItem: Text {
//          text: control.text
//          font: control.font
//          opacity: enabled ? 1.0 : 0.3
//          color: control.checked ? "#1E90FF" : "#000000"
//          horizontalAlignment: Text.AlignHCenter
//          verticalAlignment: Text.AlignVCenter
//          leftPadding: control.indicator.width + control.spacing
//      }

//      MyColors {
//          id : m_color
//      }
//  }
import QtQuick 2.0
import QtQuick.Controls 2.0

Switch {
    id: root
    property color checkedColor: "#1E90FF"

    indicator: Rectangle {
        width: 54
        height: 34
        radius: height / 2
        color: root.checked ? checkedColor : "white"
        border.width: 2
        border.color: root.checked ? checkedColor : "#DCDCDC"

        Rectangle {
            x: root.checked ? parent.width - width - 2 : 1
            width: root.checked ? parent.height - 4 : parent.height - 2
            height: width
            radius: width / 2
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            border.color: "#D5D5D5"

            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
