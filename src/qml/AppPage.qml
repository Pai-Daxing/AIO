import QtQuick 2.4
import "customCtrls"
import UiAdaptor 1.0

AppPageForm {
    id:appView

    property int chFlag: 0

    MyPopup {
        id: oneOKnoCMDpopup
        popup_exit.visible: false

        popup_OK.onClicked: {
            oneOKnoCMDpopup.close()
        }
    }

    UiAdaptor {
        id: uiadaptor_app

        onUserNameSignal: {
            for(var i = 0 ; i < list.length ; i ++) {
                processView.addUserListView(list[i].toString())
            }
        }

        //        onAllTechName: {
        //            for(var i = 0 ; i < list.length ; i ++) {
        //                detectiontech.model = list[i].toString()
        //                console.log(list[i])
        //            }
        //        }

        onLoginFailed: {
            loginPopup.open()
            loginPopup.popup_lab.text = "警告\n登录失败"
            loginPopup.popup_exit.visible = false
        }

        onLoginSucceed: {
            if( namelist[0] === "操作者")
            {
                mainView.visible = true
                mainView.anchors.top = appView.top
                login.visible = false
                main_permiss.text = "操作者"
                main_name.text = namelist[1]
            }
            else if( namelist[0] === "管理员" )
            {
                mainView.visible = true
                mainView.anchors.top = appView.top
                login.visible = false
                main_permiss.text = "管理员"
                main_name.text = namelist[1]
            }
            else {
                loginPopup.open()
                loginPopup.popup_lab.text = "警告\n登录失败"
                loginPopup.popup_exit.visible = false
            }
        }

        onCpwdError: {
            cpwdPopup.open()
            cpwdPopup.popup_exit.visible = false
            cpwdPopup.popup_lab.text = "警告\n密码修改失败"
        }

        onCpwdSucceed: {
            cpwdPopup.open()
            cpwdPopup.popup_exit.visible = false
            cpwdPopup.popup_lab.text = "提示\n密码修改成功"
        }

        onNoReadme: {
            updaPopup.open()
            updaPopup.popup_exit.visible = false
            updaPopup.popup_lab.text = "警告\n请插入带有更新包的U盘"
        }

        onCurVersionNew: {
            updaPopup.open()
            updaPopup.popup_exit.visible = false
            updaPopup.popup_lab.text = "警告\n当前已是最新版本"
        }

        onUpdateReadmeSignal: {
            updaPopup.open()
            updaPopup.popup_exit.visible = true
            updaPopup.popup_OK_text.text = "更新"
            updaPopup.popup_exit_text.text = "取消"
            updaPopup.popup_lab.text = txt
        }

        //IO量
        onSignalCh1Sample: {
            if(chFlag == 1)
                installComsum.currentIndex =  newValue ? 1 : 0
            else
                installComsum.currentIndex =  0
        }

        onSignalCh2Sample: {
            if(chFlag == 2)
                installComsum.currentIndex =  newValue ? 1 : 0
            else
                installComsum.currentIndex =  0
        }

        onSignalCh3Sample: {
            if(chFlag == 3)
                installComsum.currentIndex =  newValue ? 1 : 0
            else
                installComsum.currentIndex =  0
        }

        onSignalCh4Sample: {
            if(chFlag == 4)
                installComsum.currentIndex =  newValue ? 1 : 0
            else
                installComsum.currentIndex =  0
        }


        //////////////报警/////////////////////
        onRaiseAlarm: {
            console.log(str)
            console.log(lv)

//            var alarm = new Array(2)
//            alarm[0] = main_name.text
//            alarm[1] = testName.text
//            alarm[2] = str

//            uiadaptor_app.saveAlarm(alarm)
        }

        onCancelAlarm: {
        }

        onSetCSSCh1Step1Success: {
            uiadaptor_app.chStartRun(1, 2,ch1.protext.text)
        }
        onSetCSSCh1Step2Success: {
            uiadaptor_app.chStartRun(1, 3,ch1.protext.text)
        }
        onSetCSSCh1Step3Success: {
            uiadaptor_app.chStartRun(1, 4,ch1.protext.text)
        }
        onSetCSSCh1Step4Success: {
            uiadaptor_app.chStartRun(1, 5,ch1.protext.text)
        }
        onSetCSSCh1Step5Success: {
            uiadaptor_app.chStartRun(1, 6,ch1.protext.text)
        }
        onSetCSSCh1Step6Success: {
            uiadaptor_app.chStartRun(1, 7,ch1.protext.text)
        }
        onSetCSSCh1Step7Success: {
            uiadaptor_app.chStartRun(1, 8,ch1.protext.text)
        }
        onSetCSSCh1Step8Success: {
            uiadaptor_app.chStartRun(1, 9,ch1.protext.text)
        }
        onSetCSSCh1Step9Success: {
            uiadaptor_app.chStartRun(1, 10,ch1.protext.text)
        }
        onSetCSSCh1Step10Success: {
            ch1.statustext.text = "PCR处理"
            if(ch2.statustext.text == "等待预处理")
            {
                ch2Run()
                uiadaptor_app.ch2StartRun()
            }else if(ch3.statustext.text == "等待预处理")
            {
                ch3Run()
                uiadaptor_app.ch3StartRun()
            }else if(ch4.statustext.text == "等待预处理")
            {
                ch4Run()
                uiadaptor_app.ch4StartRun()
            }else
                uiadaptor_app.chSearchSuccess()
        }

        onSetCSSCh2Step1Success: {
            uiadaptor_app.chStartRun(2, 2,ch1.protext.text)
            addtipPopup.open()
        }
        onSetCSSCh2Step2Success: {
            uiadaptor_app.chStartRun(2, 3,ch1.protext.text)
        }
        onSetCSSCh2Step3Success: {
            uiadaptor_app.chStartRun(2, 4,ch1.protext.text)
        }
        onSetCSSCh2Step4Success: {
            uiadaptor_app.chStartRun(2, 5,ch1.protext.text)
        }
        onSetCSSCh2Step5Success: {
            uiadaptor_app.chStartRun(2, 6,ch1.protext.text)
        }
        onSetCSSCh2Step6Success: {
            uiadaptor_app.chStartRun(2, 7,ch1.protext.text)
        }
        onSetCSSCh2Step7Success: {
            uiadaptor_app.chStartRun(2, 8,ch1.protext.text)
        }
        onSetCSSCh2Step8Success: {
            uiadaptor_app.chStartRun(2, 9,ch1.protext.text)
        }
        onSetCSSCh2Step9Success: {
            uiadaptor_app.chStartRun(2, 10,ch1.protext.text)
        }
        onSetCSSCh2Step10Success: {
            ch2.statustext.text = "PCR处理"
            if(ch3.statustext.text == "等待预处理")
            {
                ch3Run()
                uiadaptor_app.ch3StartRun()
            }else if(ch4.statustext.text == "等待预处理")
            {
                ch4Run()
                uiadaptor_app.ch4StartRun()
            }else
                uiadaptor_app.chSearchSuccess()
        }

        onSetCSSCh3Step1Success: {
            uiadaptor_app.chStartRun(3, 2,ch1.protext.text)
        }
        onSetCSSCh3Step2Success: {
            uiadaptor_app.chStartRun(3, 3,ch1.protext.text)
        }
        onSetCSSCh3Step3Success: {
            uiadaptor_app.chStartRun(3, 4,ch1.protext.text)
        }
        onSetCSSCh3Step4Success: {
            uiadaptor_app.chStartRun(3, 5,ch1.protext.text)
        }
        onSetCSSCh3Step5Success: {
            uiadaptor_app.chStartRun(3, 6,ch1.protext.text)
        }
        onSetCSSCh3Step6Success: {
            uiadaptor_app.chStartRun(3, 7,ch1.protext.text)
        }
        onSetCSSCh3Step7Success: {
            uiadaptor_app.chStartRun(3, 8,ch1.protext.text)
        }
        onSetCSSCh3Step8Success: {
            uiadaptor_app.chStartRun(3, 9,ch1.protext.text)
        }
        onSetCSSCh3Step9Success: {
            uiadaptor_app.chStartRun(3, 10,ch1.protext.text)
        }
        onSetCSSCh3Step10Success: {
            ch3.statustext.text = "PCR处理"
            if(ch4.statustext.text == "等待预处理")
            {
                ch4Run()
                uiadaptor_app.ch4StartRun()
            }else
                uiadaptor_app.chSearchSuccess()
        }

        onSetCSSCh4Step1Success: {
            uiadaptor_app.chStartRun(4, 2,ch1.protext.text)
        }
        onSetCSSCh4Step2Success: {
            uiadaptor_app.chStartRun(4, 3,ch1.protext.text)
        }
        onSetCSSCh4Step3Success: {
            uiadaptor_app.chStartRun(4, 4,ch1.protext.text)
        }
        onSetCSSCh4Step4Success: {
            uiadaptor_app.chStartRun(4, 5,ch1.protext.text)
        }
        onSetCSSCh4Step5Success: {
            uiadaptor_app.chStartRun(4, 6,ch1.protext.text)
        }
        onSetCSSCh4Step6Success: {
            uiadaptor_app.chStartRun(4, 7,ch1.protext.text)
        }
        onSetCSSCh4Step7Success: {
            uiadaptor_app.chStartRun(4, 8,ch1.protext.text)
        }
        onSetCSSCh4Step8Success: {
            uiadaptor_app.chStartRun(4, 9,ch1.protext.text)
        }
        onSetCSSCh4Step9Success: {
            uiadaptor_app.chStartRun(4, 10,ch1.protext.text)
        }
        onSetCSSCh4Step10Success: {
            ch4.statustext.text = "PCR处理"
        }
        onSetCSSAddTip:{
            addtipPopup.open()
            addtipPopup.popup_exit.visible = false
            addtipPopup.popup_lab.text="提示:请补Tip头..."
        }

        onSetCSSTipTestSuccess:{
            if(chRunText.text=="通道一")
                uiadaptor_app.chStartRun(1, 2,ch1.protext.text)
            if(chRunText.text=="通道二")
                uiadaptor_app.chStartRun(2, 2,ch2.protext.text)
            if(chRunText.text=="通道三")
                uiadaptor_app.chStartRun(3, 2,ch3.protext.text)
            if(chRunText.text=="通道四")
                uiadaptor_app.chStartRun(4, 2,ch4.protext.text)
        }
    }

    adminLogin.onClicked: {
        login.anchors.top = appView.top
        login.visible = true
        selfTestView.visible = false
    }
    MyPopup{
        id:addtipPopup
        popup_OK.onClicked: {
            addtipPopup.close()
        }
    }

    /************登录界面***********************/
    MyPopup {
        id: loginPopup

        popup_OK.onClicked: {
            loginPopup.close()
        }

        popup_exit.onClicked: {
            loginPopup.close()
        }
    }

    LoginPage {
        id:login
        visible: false

        login_OK.onClicked: {
            if( passwd.text == "")
            {
                loginPopup.open()
                loginPopup.popup_lab.text = "警告\n密码不能为空"
                loginPopup.popup_exit.visible = false
            }
            else if( loginUsername.text == "")
            {
                loginPopup.open()
                loginPopup.popup_lab.text = "警告\n用户名不能为空"
                loginPopup.popup_exit.visible = false
            }
            else if(loginUsername.text == "admin" && passwd.text == "123456")
            {
                mainView.visible = true
                mainView.anchors.top = appView.top
                login.visible = false
                mainSet.visible = true
                main_permiss.text = "管理员"
                main_name.text = loginUsername.text
            }
            else if(loginUsername.text == "root" && passwd.text == "123456")
            {
                engine.visible = true
                engine.anchors.top = appView.top
                login.visible = false
            }
            else if(loginUsername.text.length > 0 && passwd.text.length > 0)
            {
                var name = new Array(1)
                name[0] = loginUsername.text
                name[1] = passwd.text
                uiadaptor_app.loginCRC(name)
            }
        }
    }

    /************工程师模式***********************/
    Engineer {
        id: engine
        visible: false

        exit_engine.onClicked: {
            login.loginUsername.text = ""
            login.passwd.text = ""
            login.visible = true
            login.anchors.top = appView.top
            engine.visible = false
        }

        listView.onCurrentIndexChanged: {
            if (listView.currentIndex == 0)
            {
                rgbSensor.visible = false
                axisView.visible = true
                dpmPumpView.visible = false
                ioView.visible = false
                axisView.anchors.top = engine.top
                axisView.anchors.right = engine.right
            }
            else if(listView.currentIndex == 1)
            {
                rgbSensor.visible = false
                axisView.visible = false
                dpmPumpView.visible = false
                ioView.visible = true
                ioView.anchors.top = engine.top
                ioView.anchors.right = engine.right
            }
            else if(listView.currentIndex == 2){
                rgbSensor.visible = true
                axisView.visible = false
                dpmPumpView.visible = false
                ioView.visible = false
                rgbSensor.anchors.top = engine.top
                rgbSensor.anchors.right = engine.right
            }
            else if(listView.currentIndex == 3){
                rgbSensor.visible = false
                axisView.visible = false
                dpmPumpView.visible = true
                ioView.visible = false
                dpmPumpView.anchors.top = engine.top
                dpmPumpView.anchors.right = engine.right
            }
        }
    }



    /************主界面***********************/

    mainSet.onClicked: {
        set_main.anchors.top = appView.top
        set_main.visible = true
        mainView.visible = false

        if( main_permiss.text == "管理员")
        {
            set_Infor.visible = true
            set_WIFI.visible = true
            set_Query.visible = true
            set_user.visible = true
            set_Update.visible = true
            set_alarm.visible = true
            set_newTech.visible = true
            set_changepwd.visible = false
        }else if(main_permiss.text == "操作者")
        {
            set_Infor.visible = false
            set_WIFI.visible = false
            set_Query.visible = false
            set_user.visible = false
            set_Update.visible = false
            set_alarm.visible = false
            set_newTech.visible = false
            set_changepwd.visible = true
        }
    }

    exitLogin.onClicked: {
        login.loginUsername.text = ""
        login.passwd.text = ""
        login.anchors.top = appView.top
        login.visible = true
        mainView.visible = false
    }
    /*************开机自检*****************/
    startSelf.onClicked: {
        uiadaptor_app.selfInspection()
    }


    /************通道设置***********************/
    MyPopup {
        id: applyAllPopup

        popup_exit.onClicked: {
            applyAllPopup.close()
        }

        popup_OK.onClicked: {
            mainView.visible = true
            mainView.anchors.top = appView.top
            chEditorView.visible = false
            apply.enabled=false

            uiadaptor_app.startTipTest()
            ch1.protext.text = detectiontech.currentText
            ch1.statustext.text = "等待预处理"
            ch1.timetext.text = "78"+" min"
            ch1.statusRec.color = "#FFFF00"
            ch2.protext.text = detectiontech.currentText
            ch2.statustext.text = "等待预处理"
            ch2.timetext.text = "78"+" min"
            ch2.statusRec.color = "#FFFF00"
            ch3.protext.text = detectiontech.currentText
            ch3.statustext.text = "等待预处理"
            ch3.timetext.text = "78"+" min"
            ch3.statusRec.color = "#FFFF00"
            ch4.protext.text = detectiontech.currentText
            ch4.statustext.text = "等待预处理"
            ch4.timetext.text = "78"+" min"
            ch4.statusRec.color = "#FFFF00"
            applyAllPopup.close()
        }
    }

    MyPopup {
        id: applyPopup

        popup_exit.onClicked: {
            applyPopup.close()
        }

        popup_OK.onClicked: {
            mainView.visible = true
            mainView.anchors.top = appView.top
            chEditorView.visible = false
            uiadaptor_app.startTipTest()
            if(chFlag == 1){
                ch1.protext.text = detectiontech.currentText
                ch1.statustext.text = "等待预处理"
                ch1.timetext.text = "78"+" min"
                ch1.statusRec.color = "#FFFF00"
            }
            else if(chFlag == 2){
                ch2.protext.text = detectiontech.currentText
                ch2.statustext.text = "等待预处理"
                ch2.timetext.text = "78"+" min"
                ch2.statusRec.color = "#FFFF00"
            }
            else if(chFlag == 3){
                ch3.protext.text = detectiontech.currentText
                ch3.statustext.text = "等待预处理"
                ch3.timetext.text = "78"+" min"
                ch3.statusRec.color = "#FFFF00"
            }
            else if(chFlag == 4){
                ch4.protext.text = detectiontech.currentText
                ch4.statustext.text = "等待预处理"
                ch4.timetext.text = "78"+" min"
                ch4.statusRec.color = "#FFFF00"
            }
            applyPopup.close()

        }
    }
    apply.onClicked: {
        if(detectiontech.currentText == "")
        {
            oneOKnoCMDpopup.open()
            oneOKnoCMDpopup.popup_lab.text = "警告\n请设置有效检测工艺"
        }else{
            applyPopup.open()
            applyPopup.popup_lab.text = "提示\n请确认TIP头和检测试剂已安装"
        }
    }

    applyAll.onClicked: {
        if(detectiontech.currentText == "")
        {
            oneOKnoCMDpopup.open()
            oneOKnoCMDpopup.popup_lab.text = "警告\n请设置有效检测工艺"
        }else{
            applyAllPopup.open()
            applyAllPopup.popup_lab.text = "提示\n请确认TIP头和检测试剂已安装"
        }
    }

    cheditorreturn.onClicked: {
        mainView.visible = true
        mainView.anchors.top = appView.top
        chEditorView.visible = false
    }
    ch1.onClicked: {
        if( ch1.statustext.text == "预处理" || ch1.statustext.text == "暂停"
                || ch1.statustext.text == "完成" || ch1.statustext.text == "等待预处理" )
        {
            chRunView.anchors.top = appView.top
            chRunView.visible = true
            mainView.visible = false
            chRunText.text = ch1.chtext.text
        }else{
            chFlag = 1
            detectiontech.model =  uiadaptor_app.selectAllTech()
            uiadaptor_app.selectAllTech()
            chEditorView.anchors.top = appView.top
            chEditorView.visible = true
            mainView.visible = false
            operator.text = main_name.text
            currentCH.text = ch1.chtext.text
        }
         applyAllBtn()
    }

    ch2.onClicked: {
        if( ch2.statustext.text == "预处理" || ch2.statustext.text == "暂停"
                || ch2.statustext.text == "完成" || ch2.statustext.text == "等待预处理" )
        {
            chRunView.anchors.top = appView.top
            chRunView.visible = true
            mainView.visible = false
            chRunText.text = ch2.chtext.text
        }else{
            chFlag = 2
            uiadaptor_app.selectAllTech()
            detectiontech.model =  uiadaptor_app.selectAllTech()
            chEditorView.anchors.top = appView.top
            chEditorView.visible = true
            mainView.visible = false
            operator.text = main_name.text
            currentCH.text = ch2.chtext.text
        }
         applyAllBtn()
    }

    ch3.onClicked: {
        if( ch3.statustext.text == "预处理" || ch3.statustext.text == "暂停"
                || ch3.statustext.text == "完成" || ch3.statustext.text == "等待预处理" )
        {
            chRunView.anchors.top = appView.top
            chRunView.visible = true
            mainView.visible = false
            chRunText.text = ch3.chtext.text
        }else{
            chFlag = 3
            uiadaptor_app.selectAllTech()
            detectiontech.model =  uiadaptor_app.selectAllTech()
            chEditorView.anchors.top = appView.top
            chEditorView.visible = true
            mainView.visible = false
            operator.text = main_name.text
            currentCH.text = ch3.chtext.text
        }
         applyAllBtn()
    }

    ch4.onClicked: {
        if( ch4.statustext.text == "预处理" || ch4.statustext.text == "暂停"
                || ch4.statustext.text == "完成" || ch4.statustext.text == "等待预处理" )
        {
            chRunView.anchors.top = appView.top
            chRunView.visible = true
            mainView.visible = false
            chRunText.text = ch4.chtext.text
        }else{
            chFlag = 4
            uiadaptor_app.selectAllTech()
            detectiontech.model =  uiadaptor_app.selectAllTech()
            chEditorView.anchors.top = appView.top
            chEditorView.visible = true
            mainView.visible = false
            operator.text = main_name.text
            currentCH.text = ch4.chtext.text
        }
         applyAllBtn()
    }

    function applyAllBtn()
    {
        if(ch1.statustext.text==="空闲"&&ch2.statustext.text==="空闲"&&ch3.statustext.text==="空闲"&&ch4.statustext.text==="空闲")
        {
            applyAll.enabled=true
            apply.enabled=true
        }
        else
        {
            applyAll.enabled=false
        }

    }

    function ch1Run()
    {
        ch1.statustext.text = "预处理"
        ch1.timetext.text = "78"+" min"
        ch1.statusRec.color = "#008000"
    }

    function ch2Run()
    {
        ch2.statustext.text = "预处理"
        ch2.timetext.text = "78"+" min"
        ch2.statusRec.color = "#008000"
    }

    function ch3Run()
    {
        ch3.statustext.text = "预处理"
        ch3.timetext.text = "78"+" min"
        ch3.statusRec.color = "#008000"
    }

    function ch4Run()
    {
        ch4.statustext.text = "预处理"
        ch4.timetext.text = "78"+" min"
        ch4.statusRec.color = "#008000"
    }

    function ch1Stop()
    {
        ch1.statustext.text = "暂停"
        ch1.timetext.text = "78"+" min"
        ch1.statusRec.color = "#FF0000"
    }

    function ch2Stop()
    {
        ch2.statustext.text = "暂停"
        ch2.timetext.text = "78"+" min"
        ch2.statusRec.color = "#FF0000"
    }

    function ch3Stop()
    {
        ch3.statustext.text = "暂停"
        ch3.timetext.text = "78"+" min"
        ch3.statusRec.color = "#FF0000"
    }

    function ch4Stop()
    {
        ch4.statustext.text = "暂停"
        ch4.timetext.text = "78"+" min"
        ch4.statusRec.color = "#FF0000"
    }

    chRun.onClicked: {
        if(chRun.status === 0)
        {
            if(ch1.statustext.text != "空闲" ||
                    ch2.statustext.text != "空闲" ||
                    ch3.statustext.text != "空闲" ||
                    ch4.statustext.text != "空闲" )
            {
                chRun.status = 1
                chRun.text = "暂停"
                exitLogin.enabled = false

                if(ch1.statustext.text == "等待预处理" || ch1.statustext.text == "暂停")
                {
                    ch1Run()
                    uiadaptor_app.chStartRun(1, 1,ch1.protext.text)
                }else if(ch2.statustext.text == "等待预处理" || ch2.statustext.text == "暂停")
                {
                    ch2Run()
                    uiadaptor_app.chStartRun(2, 1,ch1.protext.text)
                }else if(ch3.statustext.text == "等待预处理" || ch3.statustext.text == "暂停")
                {
                    ch3Run()
                    uiadaptor_app.chStartRun(3, 1,ch1.protext.text)
                }else if(ch4.statustext.text == "等待预处理" || ch4.statustext.text == "暂停")
                {
                    ch4Run()
                    uiadaptor_app.chStartRun(4, 1,ch1.protext.text)
                }else
                    uiadaptor_app.chSearchSuccess()
            }else{
                oneOKnoCMDpopup.open()
                oneOKnoCMDpopup.popup_lab.text = "警告\n当前没有可运行的通道"
            }
            console.log("运行代码")
        }else
        {
            console.log("暂停代码")
            chRun.status = 0
            chRun.text = "运行"
            exitLogin.enabled = true
            if(ch1.statustext.text == "预处理")
            {
                ch1Stop()
            }else if(ch2.statustext.text == "预处理")
            {
                ch2Stop()
            }else if(ch3.statustext.text == "预处理")
            {
                ch3Stop()
            }else if(ch4.statustext.text == "预处理")
            {
                ch4Stop()
            }
        }
    }

    /************运行界面***********************/
    chRunReturn.onClicked: {
        mainView.visible = true
        mainView.anchors.top = appView.top
        chRunView.visible = false
    }
    cancle.onClicked:{
        mainView.anchors.top = appView.top
        mainView.visible = true
        chRunView.visible = false
        apply.enabled=true

        if(chRunText.text===ch1.chtext.text)
        {
            ch1.statustext.text="空闲"
            ch1.timetext.text="0"+" min"
            ch1.protext.text="NA"
            ch1.statusRec.color= "#F5F5F5"

        }
        if(chRunText.text===ch2.chtext.text)
        {
            ch2.statustext.text="空闲"
            ch2.timetext.text="0"+" min"
            ch2.protext.text="NA"
            ch2.statusRec.color= "#F5F5F5"
        }
        if(chRunText.text===ch3.chtext.text)
        {
            ch3.statustext.text="空闲"
            ch3.timetext.text="0"+" min"
            ch3.protext.text="NA"
            ch3.statusRec.color= "#F5F5F5"
        }
        if(chRunText.text===ch4.chtext.text)
        {
            ch4.statustext.text="空闲"
            ch4.timetext.text="0"+" min"
            ch4.protext.text="NA"
            ch4.statusRec.color= "#F5F5F5"
        }
    }

    /************设置界面***********************/
    set_Return.onClicked: {
        mainView.visible = true
        mainView.anchors.top = appView.top
        set_main.visible = false
    }

    set_user.onClicked: {
        userset.visible = true
        userset.anchors.top = appView.top
        set_main.visible = false
        SqlQueryModel.nameTbFresh()
    }

    /************新建工艺界面***********************/
    set_newTech.onClicked: {
        experimentView.anchors.top = appView.top
        experimentView.visible = true
        set_main.visible = false
        techview.visible = true
        SqlQueryModel.techClear()
    }

    TechView {
        id: techview
        x: 420
        y: 180
        visible: false

        techtable.onClicked: {
            var row = techtable.currentRow.toString()
            projectName.text = SqlQueryModel.data(SqlQueryModel.index(row,0))
            cbbStep.currentIndex = (SqlQueryModel.data(SqlQueryModel.index(row,1)))-1
            //            fetchHole.currentText = SqlQueryModel.data(SqlQueryModel.index(row,2))
            //            rHole.currentText = SqlQueryModel.data(SqlQueryModel.index(row,3))
            //            mixNum.text = SqlQueryModel.data(SqlQueryModel.index(row,4))
            //            replaceTIP.currentText = SqlQueryModel.data(SqlQueryModel.index(row,5))

        }

    }

    experimentReturn.onClicked: {
        set_main.visible = true
        set_main.anchors.top = appView.top
        experimentView.visible = false
        techview.visible = false
    }

    experimentADD.onClicked: {
        var tech = new Array(6)
        tech[0] = projectName.text
        tech[1] = cbbStep.currentText
        tech[2] = fetchHole.currentText
        tech[3] = rHole.currentText
        tech[4] = moveWaterV.text
        tech[5] = mixNum.text
        tech[6] = replaceTIP.currentText
        uiadaptor_app.saveTech(tech)
        SqlQueryModel.techTbFresh(projectName.text)
    }

    experimentDel.onClicked: {
        uiadaptor_app.delTech(cbbStep.currentText)
        SqlQueryModel.techTbFresh(projectName.text)
    }

    /**************************用户设置界面***************************************/
    UserSetForm {
        id:userset
        visible: false

        property var rsltTableArray:
            [["所属权限", "用户名", "密码"],
            [100,100,100],
            ["permiss", "name","passwd"]]

        UserView {
            id: table
            x: 500
            y:240
            width: 300
            height: 420
            Component.onCompleted: {
                table.updateColumn2Table(userset.rsltTableArray);    //创建表
            }

            onClicked: {
                var row = table.currentRow.toString()
                var index0 = SqlQueryModel.index(row,0)
                var index1 = SqlQueryModel.index(row,1)
                userset.username.text = SqlQueryModel.data(index1)
                var index2 = SqlQueryModel.index(row,2)
                userset.passwd.text = SqlQueryModel.data(index2)
                if(SqlQueryModel.data(index0) === "操作者")
                    userset.permiss.currentIndex = 0
                else if(SqlQueryModel.data(index0) === "管理员")
                    userset.permiss.currentIndex = 1
            }
        }

        userset_Return.onClicked: {
            userset.visible = false
            set_main.visible = true
            set_main.anchors.top = appView.top
        }

        userUpdate.onClicked: {
            var NameParam = new Array(2)
            NameParam[0] = permiss.currentText
            NameParam[1] = username.text
            NameParam[2] = passwd.text

            uiadaptor_app.saveNameParam(NameParam)
            SqlQueryModel.nameTbFresh()
        }

        userDel.onClicked: {
            uiadaptor_app.delNameParam(username.text)
            SqlQueryModel.nameTbFresh()
        }
    }

    /**************************wifi设置界面***************************************/
    set_WIFI.onClicked: {
        wifiView.visible = true
        wifiView.anchors.top = appView.top
        set_main.visible = false
    }

    WifiPage {
        id: wifiView
        visible: false

        wifiset_Return.onClicked: {
            wifiView.visible = false
            set_main.visible = true
            set_main.anchors.top = appView.top
        }
    }

    set_Infor.onClicked: {
        inforView.visible = true
        inforView.anchors.top = appView.top
        set_main.visible = false
    }

    /**************************本机信息界面***************************************/
    FactoryInfor {
        id: inforView
        visible: false

        messset_Return.onClicked: {
            inforView.visible = false
            set_main.visible = true
            set_main.anchors.top = appView.top
        }
    }

    /************数据导出界面**********************/
    set_Data.onClicked: {
        if(main_permiss.text == "管理员")
        {
            pdfView.lv.folderModel.nameFilters = ["*.pdf"]
            pdfView.visible = true
            pdfView.anchors.top = appView.top
            set_main.visible = false
        }else if(main_permiss.text == "操作者")
        {
            pdfView.lv.folderModel.nameFilters = ["*" + main_name.text + "*.pdf"]
            pdfView.visible = true
            pdfView.anchors.top = appView.top
            set_main.visible = false
        }
    }

    ExportPdfPage {
        id: pdfView
        visible: false

        pdfset_Return.onClicked: {
            pdfView.visible = false
            set_main.visible = true
            set_main.anchors.top = appView.top
        }
    }

    /************密码修改界面**********************/
    MyPopup {
        id: cpwdPopup

        popup_OK.onClicked: {
            cpwdPopup.close()
        }
    }

    set_changepwd.onClicked: {
        cpwdView.visible = true
        cpwdView.anchors.top = appView.top
        set_main.visible = false
        cpwdView.changePWDname.text = main_name.text
    }

    ChangePWDPage {
        id: cpwdView
        visible: false

        changePWD_Return.onClicked: {
            cpwdView.visible = false
            set_main.visible = true
            set_main.anchors.top = appView.top
            changePWDText.text = ""
        }

        changePWD_OK.onClicked: {
            if( changePWDText.text == "")
            {
                cpwdPopup.open()
                cpwdPopup.popup_exit.visible = false
                cpwdPopup.popup_lab.text = "警告\n新密码不能为空"
            }else
            {
                var cpwd = new Array(1)
                cpwd[0] = main_name.text
                cpwd[1] = changePWDText.text
                uiadaptor_app.changeOperatorPWD(cpwd)
            }
        }
    }

    /************版本更新界面**********************/
    MyPopup {
        id: updaPopup

        popup_OK.onClicked: {
            if( popup_OK_text.text == "确定")
                updaPopup.close()
            else if(popup_OK_text.text == "更新")
            {
                uiadaptor_app.updateSoft()
                updaPopup.popup_lab.text = "程序已更新\n请立即重启设备"
                updaPopup.popup_exit.visible = false
                updaPopup.popup_OK_text.text = "确定"
            }
        }

        popup_exit.onClicked: {
            updaPopup.close()
        }
    }

    set_Update.onClicked: {
        //        updateView.visible = true
        //        updateView.anchors.top = appView.top
        //        set_main.visible = false
        uiadaptor_app.updateReadme()
    }

    //    UpdatePage {
    //        id: updateView
    //        visible: false

    //        update_Return.onClicked: {
    //            updateView.visible = false
    //            set_main.visible = true
    //            set_main.anchors.top = appView.top
    //        }

    //        update_OK.onClicked: {
    //            uiadaptor_app.updateReadme()
    //        }
    //    }

    /***********报警信息界面**********************/
    AlarmPage {
        id: alarmView
        visible: false

        property var rsltTableArray:
            [["用户", "项目名称", "开始时间", "报警信息"],
            [100,100,100,100],
            ["username", "project","starttime","alarmstr"]]

        UserView {
            id: alarmViewtable
            x: 90
            y: 168
            width: 700
            height: 556
            Component.onCompleted: {
                alarmViewtable.updateColumn2Table(alarmView.rsltTableArray);    //创建表
            }
        }

        alarm_Return.onClicked: {
            alarmView.visible = false
            set_main.anchors.top = appView.top
            set_main.visible = true
        }
    }

    set_alarm.onClicked: {
        alarmView.visible = true
        alarmView.anchors.top = appView.top
        set_main.visible = false
        SqlQueryModel.alarmTbFresh()
    }

    /***********查询工艺界面**********************/
    MyPopup {
        id:queryDelPopup
        popup_OK_text.text: "删除"
        popup_exit_text.text: "取消"

        popup_OK.onClicked: {
            uiadaptor_app.delTechOne(queryTechView.queryTechCbb.currentText)
            SqlQueryModel.techAllFrech()
            queryTechView.queryTechCbb.model =  uiadaptor_app.selectAllTech()
            uiadaptor_app.selectAllTech()
            queryDelPopup.close()
        }

        popup_exit.onClicked: {
            queryDelPopup.close()
        }
    }

    set_Query.onClicked: {
        queryTechView.visible = true
        queryTechView.anchors.top = appView.top
        set_main.visible = false
        SqlQueryModel.techAllFrech()
        queryTechView.queryTechCbb.model =  uiadaptor_app.selectAllTech()
        uiadaptor_app.selectAllTech()
    }

    QueryTechForm {
        id: queryTechView
        visible: false

        property var queryTableArray:
            [["工艺名称", "步骤", "取物孔", "置物孔", "移液量", "混合次数", "更换TIP头"],
            [100,50,80,80,80,100,100],
            ["techname", "steps","fetchhole","rhole", "mwv","mixnum","tip"]]

        UserView {
            id: querytable
            x: 90
            y: 168
            width: 860
            height: 556
            Component.onCompleted: {
                querytable.updateColumn2Table(queryTechView.queryTableArray);    //创建表
            }
        }

        queryAll.onClicked: {
            SqlQueryModel.techAllFrech()
        }

        queryTechKB.onClicked: {
            SqlQueryModel.techTbFresh(queryTechCbb.currentText)
        }

        delTechKB.onClicked: {
            queryDelPopup.open()
            queryDelPopup.popup_lab.text = "警告\n是否删除工艺\n"+queryTechCbb.currentText
        }

        queryTechReturn.onClicked: {
            queryTechView.visible = false
            set_main.anchors.top = appView.top
            set_main.visible = true
        }
    }
}

