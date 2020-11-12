import QtQuick 2.6
import QtQuick.Controls 2.0
CheckBox {
          id: control1
          x:10
          y:10
          property alias chkLab: chkLab
          indicator: Rectangle {
              implicitWidth: 350
              implicitHeight: 80
              x: control1.leftPadding
              y: parent.height / 2 - height / 2
              radius: 5
              border.color: control1.checked ? "#1E90FF" : "#000000"
              border.width: 2

              MyLabel {
                  id: chkLab
                  anchors.right: parent.right
                  anchors.rightMargin: 5
                  anchors.bottom: parent.bottom
                  text: qsTr("")
                  font.bold: false
                  font.pixelSize: 22
                  color: control1.checked ? "#1E90FF" : "#000000"
              }

              Image {
                  width: 14
                  height: 14
                  x: 6
                  y: 6
                  source: control1.checked ? "/res/checked.png" : ""
                  visible: control1.checked
              }
          }

          contentItem: Text {
              text: control1.text
              font: control1.font
              opacity: enabled ? 1.0 : 0.3
              color: control1.down ? "#17a81a" : "#21be2b"
              verticalAlignment: Text.AlignVCenter
              leftPadding: control1.indicator.width + control1.spacing
          }
      }
