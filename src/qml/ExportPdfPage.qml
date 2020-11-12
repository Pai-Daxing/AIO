import QtQuick 2.4
import "customCtrls"
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls14
import Qt.labs.folderlistmodel 2.1
import UiAdaptor 1.0

Item {
    id: pdf

    property alias pdfset_Return: pdfset_Return
    property alias lv: lv

    width: 1280
    height: 800
    visible: false

    UiAdaptor {
        id: uiadaptor_pdf

        onUsbIsNull:{
            pdfPopup.open()
            pdfPopup.popup_exit.visible = false
            pdfPopup.popup_lab.text = "警告\n请插入有效U盘"
        }

        onCopySuccee:{
            pdfPopup.open()
            pdfPopup.popup_exit.visible = false
            pdfPopup.popup_lab.text = "提示\n数据导出成功"
        }

        onCacheIsNull: {
            pdfPopup.open()
            pdfPopup.popup_exit.visible = false
            pdfPopup.popup_lab.text = "警告\n请选择有效数据"
        }
    }

    MyPopup {
        id: pdfPopup

        popup_OK.onClicked: {
            pdfPopup.close()
        }
    }

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
        text: "数据导出"
        color: "#000000"
        font.pixelSize: 28
    }

    Rectangle {
        x: 40
        y: 143
        height: 606
        width: 800
        radius: 10
        color: "#DCDCDC"
        border.color: "#000000"
        border.width: 2

        ListView {
            id: lv
            x: 40
            y:40
            width: 700
            height: 500
            clip:true

            //-----------------------------------------
            // public
            //-----------------------------------------
            property int rowHeight: 40                    // 行高
            property int fontSize: 20                     // 字体大小
            property color hightlightColor: "#d0d0d0"     // 高亮行背景色
            property var fileFilter : ["*.pdf"]           // 文件过滤器
            property string initFolder: 'file:///home/pi/PDF/'
            //            property string initFolder: 'file:///home/slrom/qtworks/enlish/exe/pipette/PDF/'
            // 初始目录
            property string rootFolder : '../'            // 限制根目录，不可再往上查找
            property alias folderModel: folderModel
            // 点击事件（包括文件和目录）
            signal itemClicked(var item);

            //-----------------------------------------
            // 模型
            //-----------------------------------------
            model: FolderListModel {
                id: folderModel
                //                nameFilters: lv.fileFilter
                folder: lv.initFolder
                showDirs: true         //是否显示文件夹。默认为真
                showDotAndDotDot: false //如果为真，"." and ".."目录被包含在model中，否则被排除。默认为假
                sortField: FolderListModel.Time //设置排序模式,是一个枚举值，下面进行讲解
                showOnlyReadable: true
                sortReversed: false      //如果为真，逆转排序顺序。默认为假
            }

            //-----------------------------------------
            // 滚动条
            //-----------------------------------------
            ScrollBar.vertical: ScrollBar {       //滚动条
                anchors.right: lv.right
                width: 10
                active: true
                background: Item {            //滚动条的背景样式
                    Rectangle {
                        anchors.centerIn: parent
                        height: parent.height
                        width: parent.width * 0.2
                        color: "#F8F8FF"
                        radius: width/2
                    }
                }

                contentItem: Rectangle {
                    radius: width/2        //bar的圆角
                    color: "#A9A9A9"
                }
            }
            //-----------------------------------------
            // 代理
            //-----------------------------------------
            delegate: Rectangle{
                id: lvdelegate
                x: 10
                color: "#DCDCDC"
                width: parent.width
                height: lv.rowHeight

                Text {
                    text: fileName
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    font.pixelSize: lv.fontSize
                    x: 5
                }

                CheckBox {
                    id:checkbox
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right;
                    anchors.rightMargin: 50
                }

                Rectangle{
                    width: parent.width-50
                    height:1
                    color: '#f0f0f0'
                    y: parent.height - 1
                    x: 0
                }

                MouseArea{
                    anchors.fill:  parent
                    onClicked: {
                        parent.ListView.view.currentIndex = index
                        if(checkbox.checked == false){
                            checkbox.checked = true
                            // 触发节点点击事件
                            var json = {
                                name: fileName,
                                path: filePath,
                            };
                            //  console.debug(JSON.stringify(json));
                            uiadaptor_pdf.copyPdf(fileName)
                            lv.itemClicked(json);
                        }
                        else{
                            checkbox.checked = false
                            uiadaptor_pdf.delPdf(fileName)
                        }
                    }
                }
            }
        }
    }

    //    KeyButton {
    //        id: dataDel
    //        x: 1040
    //        y: 479
    //        width: 200
    //        height: 70
    //        text: "数据删除"
    //        btnIcon.source: "/res/datadel.png"
    //    }

    KeyButton {
        id: copy
        x: 1040
        y: 579
        width: 200
        height: 70
        text: "数据导出"
        btnIcon.source: "/res/export.png"
        onClicked: {
            uiadaptor_pdf.copyToUSB()
        }
    }

    KeyButton {
        id: pdfset_Return
        x: 1040
        y: 679
        width: 200
        height: 70
        text: "返回"
        btnIcon.source: "/res/last.png"
    }
}
