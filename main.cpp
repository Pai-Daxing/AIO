#include<QApplication>
#include <QQmlApplicationEngine>
#include "src/Keyboard/mykeyboard.h"
#include "src/DataStorage/datamgr.h"
#include "src/Protocol/commands.h"
#include "src/SerialApp/serialapp.h"
#include "src/ParamMgr/parammgr.h"
#include "src/StatusMgr/statusmgr.h"
#include "src/DataStorage/cfg.h"
#include "src/DataStorage/datastorage.h"
#include "src/DataStorage/sqlquerymodel.h"
#include "src/DataStorage/simplequerymodel.h"
#include "src/AlarmMgr/soundlightmgr.h"
#include "src/DataStorage/datamgr.h"
#include "src/DataStorage/debuglog.h"
#include "src/UI/uiadaptor.h"
#include "src/DataStorage/sqlquerymodel.h"
#include "src/AlarmMgr/alarmmgr.h"
//#include "src/wiringPi/wiringPi.h"
#include <QQmlContext>
#include "src/Dev/Broken/qmlplot.h"
#include <QtPrintSupport/QPrinter>
bool modelInitilize();
bool bUpgrade = false;
QString gCOM_Name;

int main(int argc, char *argv[])
{
//    qInstallMessageHandler(outPutDebugLogFile);
    QApplication app(argc, argv);

    qmlRegisterType<MyKeyboard>("mykeyboard", 1, 0, "MyKeyboard");
    qmlRegisterType<UiAdaptor>("UiAdaptor", 1, 0, "UiAdaptor");
    qmlRegisterType<CustomPlotPressure>("CustomPlotPressure", 1, 0, "CustomPlotPressure");

    modelInitilize();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
    engine.rootContext()->setContextProperty("SqlQueryModel", new SqlQueryModel(&engine));

    return app.exec();
}

bool modelInitilize()
{
    bool ret = false;
//    SoundLightMgr::getInst().init();
    DataStorage::getInstance().init(); //需要放在DataMgr初始化前
    DataMgr::getInst().init();             //一定要在ParamMgr:init前进行
//    Network::getInstance().init();

#ifdef Q_WS_WIN32
    gCOM_Name = Cfg::getInst().getUsrCfgStr(CFG_COM_WIN32);
    if (gCOM_Name == "") gCOM_Name = "COM8";
#else
    gCOM_Name = Cfg::getInst().getUsrCfgStr(CFG_COM_LINUX);
    if (gCOM_Name == "") gCOM_Name = "/dev/ttyAMA0";
#endif

    ret = SerialApp::getInstance().init(gCOM_Name);
    if (ret)
    {
        QObject* sender = &SerialApp::getInstance();
        StatusMgr::getInstance().init(sender);
        AlarmMgr::getInstance().init(sender);
        ParamMgr::getInstance()->init(sender);
    }
    else
    {
        qDebug("shibai");
    }

//#ifndef  Q_WS_WIN32
//    wiringPiSetup();
//    pinMode(7,OUTPUT);
//    pinMode(0,OUTPUT);
//    pinMode(3,OUTPUT);

//    digitalWrite(0,HIGH);
//    delay(1000);
//    digitalWrite(0,LOW);

//    delay(1000);
//    digitalWrite(3,HIGH);
//    delay(1000);
//    digitalWrite(3,LOW);

//    delay(1000);
//    digitalWrite(7,HIGH);
//    delay(1000);
//    digitalWrite(7,LOW);

//    delay(1000);
//    digitalWrite(7,HIGH);
//#endif
    return ret;
}
