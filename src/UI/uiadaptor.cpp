#include "uiadaptor.h"
#include "../DataStorage/datastorage.h"
#include "../DataStorage/cfg.h"
#include "../DataStorage/dbtable.h"
#include "../ParamMgr/parammgr.h"
#include "../StatusMgr/statusmgr.h"
#include "../SerialApp/serialapp.h"
#include "../AlarmMgr/alarmmgr.h"
#include "../AlarmMgr/alarmstr.h"
#include "../Dev/udisk.h"
#include <QMutex>//加锁
#include <qmath.h>
#include <QFile>
#include <QPdfWriter>
#include <QTextOption>
#include <QPainter>
#include <QDateTime>
#include <QDebug>

QMutex mutex;
float initCompen = 60;

UiAdaptor::UiAdaptor(QObject *parent) : QObject(parent)
{
    m_pExecProc = new QProcess();

    connect( &StatusMgr::getInstance(), &StatusMgr::controlSystemStatusChanged, this, &UiAdaptor::onCtrlSysStatusChanged);
    connect( this, &UiAdaptor::UICmd, &SerialApp::getInstance(), &SerialApp::onUICmd);
    connect( uDisk::getInst(), &uDisk::udiskRemove, this ,&UiAdaptor::udiskRemove);
    connect( uDisk::getInst(), &uDisk::udiskAdd, this ,&UiAdaptor::udiskAdd);

    connect( ParamMgr::getInstance(), &ParamMgr::signalRamPumpBackzero, this, &UiAdaptor::signalRamPumpBackzero);
    connect( ParamMgr::getInstance(), &ParamMgr::signalRamPumpTIP, this, &UiAdaptor::signalRamPumpTIP);
    connect( ParamMgr::getInstance(), &ParamMgr::signalPutWasteBox, this, &UiAdaptor::signalPutWasteBox);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCloseWasteBox, this, &UiAdaptor::signalCloseWasteBox);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh1PutRagent, this, &UiAdaptor::signalCh1PutRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh2PutRagent, this, &UiAdaptor::signalCh2PutRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh3PutRagent, this, &UiAdaptor::signalCh3PutRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh4PutRagent, this, &UiAdaptor::signalCh4PutRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh1CloseRagent, this, &UiAdaptor::signalCh1CloseRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh2CloseRagent, this, &UiAdaptor::signalCh2CloseRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh3CloseRagent, this, &UiAdaptor::signalCh3CloseRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh4CloseRagent, this, &UiAdaptor::signalCh4CloseRagent);
    connect( ParamMgr::getInstance(), &ParamMgr::signalDoorClose, this, &UiAdaptor::signalDoorClose);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh1Sample, this, &UiAdaptor::signalCh1Sample);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh2Sample, this, &UiAdaptor::signalCh2Sample);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh3Sample, this, &UiAdaptor::signalCh3Sample);
    connect( ParamMgr::getInstance(), &ParamMgr::signalCh4Sample, this, &UiAdaptor::signalCh4Sample);

    connect(&AlarmMgr::getInstance(), &AlarmMgr::triggerAlarm, this, &UiAdaptor::onAlarmStart);
    connect(&AlarmMgr::getInstance(), &AlarmMgr::cancelAlarm, this, &UiAdaptor::onCancelAlarm);
}

void UiAdaptor::onAlarmStart(AlarmInfo alarm)
{
    QString str = AlarmString::getInstance().getStr(alarm.type);
    QString details = AlarmString::getInstance().getDetail(alarm.type);
    emit raiseAlarm(alarm.latch, str ,details);
}

void UiAdaptor::onCancelAlarm(AlarmInfo alarm)
{
    Q_UNUSED(alarm);

    emit cancelAlarm();
}


void UiAdaptor::onCtrlSysStatusChanged(qint16 newStatus)
{
    switch ((ControlSystemStatus)newStatus)
    {
    case CSS_standby:
        emit setCSS2StandBy();
        break;
    case CSS_Ch1Step1Success:
        emit setCSSCh1Step1Success();
        break;
    case CSS_Ch1Step2Success:
        emit setCSSCh1Step2Success();
        break;
    case CSS_Ch1Step3Success:
        emit setCSSCh1Step3Success();
        break;
    case CSS_Ch1Step4Success:
        emit setCSSCh1Step4Success();
        break;
    case CSS_Ch1Step5Success:
        emit setCSSCh1Step5Success();
        break;
    case CSS_Ch1Step6Success:
        emit setCSSCh1Step6Success();
        break;
    case CSS_Ch1Step7Success:
        emit setCSSCh1Step7Success();
        break;
    case CSS_Ch1Step8Success:
        emit setCSSCh1Step8Success();
        break;
    case CSS_Ch1Step9Success:
        emit setCSSCh1Step9Success();
        break;
    case CSS_Ch1Step10Success:
        emit setCSSCh1Step10Success();
        break;

    case CSS_Ch2Step1Success:
        emit setCSSCh2Step1Success();
        break;
    case CSS_Ch2Step2Success:
        emit setCSSCh2Step2Success();
        break;
    case CSS_Ch2Step3Success:
        emit setCSSCh2Step3Success();
        break;
    case CSS_Ch2Step4Success:
        emit setCSSCh2Step4Success();
        break;
    case CSS_Ch2Step5Success:
        emit setCSSCh2Step5Success();
        break;
    case CSS_Ch2Step6Success:
        emit setCSSCh2Step6Success();
        break;
    case CSS_Ch2Step7Success:
        emit setCSSCh2Step7Success();
        break;
    case CSS_Ch2Step8Success:
        emit setCSSCh2Step8Success();
        break;
    case CSS_Ch2Step9Success:
        emit setCSSCh2Step9Success();
        break;
    case CSS_Ch2Step10Success:
        emit setCSSCh2Step10Success();
        break;

    case CSS_Ch3Step1Success:
        emit setCSSCh3Step1Success();
        break;
    case CSS_Ch3Step2Success:
        emit setCSSCh3Step2Success();
        break;
    case CSS_Ch3Step3Success:
        emit setCSSCh3Step3Success();
        break;
    case CSS_Ch3Step4Success:
        emit setCSSCh3Step4Success();
        break;
    case CSS_Ch3Step5Success:
        emit setCSSCh3Step5Success();
        break;
    case CSS_Ch3Step6Success:
        emit setCSSCh3Step6Success();
        break;
    case CSS_Ch3Step7Success:
        emit setCSSCh3Step7Success();
        break;
    case CSS_Ch3Step8Success:
        emit setCSSCh3Step8Success();
        break;
    case CSS_Ch3Step9Success:
        emit setCSSCh3Step9Success();
        break;
    case CSS_Ch3Step10Success:
        emit setCSSCh3Step10Success();
        break;

    case CSS_Ch4Step1Success:
        emit setCSSCh4Step1Success();
        break;
    case CSS_Ch4Step2Success:
        emit setCSSCh4Step2Success();
        break;
    case CSS_Ch4Step3Success:
        emit setCSSCh4Step3Success();
        break;
    case CSS_Ch4Step4Success:
        emit setCSSCh4Step4Success();
        break;
    case CSS_Ch4Step5Success:
        emit setCSSCh4Step5Success();
        break;
    case CSS_Ch4Step6Success:
        emit setCSSCh4Step6Success();
        break;
    case CSS_Ch4Step7Success:
        emit setCSSCh4Step7Success();
        break;
    case CSS_Ch4Step8Success:
        emit setCSSCh4Step8Success();
        break;
    case CSS_Ch4Step9Success:
        emit setCSSCh4Step9Success();
        break;
    case CSS_Ch4Step10Success:
        emit setCSSCh4Step10Success();
        break;
    case CSS_SelfTest:                //开机自检
        emit setCSSSelfTest();
        break;
    case CSS_TipTestSuccess:          //tip检测完成
        emit setCSSTipTestSuccess();
        break;
    case CSS_cover_close:             //提示关闭舱门
        emit setCSSCoverClose();
        break;
    case CSS_selftest_over:           //自检结束
        emit setCSSSelftestOver();
        break;
    case CSS_Selfcover:               //舱门自检
        emit setCSSSelfcover();
        break;
    case CSS_SelfZcan:
        emit setCSSSelfZcan();        //z轴自检
        break;
    case CSS_SelfYcan:
        emit setCSSSelfYcan();
        break;
    case CSS_SelfXcan:
        emit setCSSSelfXcan();
        break;
    case CSS_addTip:                  //提示补tip
        emit setCSSAddTip();
        break;

    default:
        break;
    }
}

void UiAdaptor::startTipTest()
{
    UICmd(CMD_TipTest,0,0);
}
void UiAdaptor::okChStartRun()
{
    UICmd(CMD_ChStartRun,0,0);
}

void UiAdaptor::chStartRun(QString ch, QString num, QString tech)
{
    CmdParam ch1;
    QSqlQuery query;

    query.exec( QString("SELECT * from TechTable where techname='%1' AND steps='%2'")
                .arg( tech )
                .arg( num ));

    if(query.next())
    {
        QString step     = query.value(1).toString();
        QString fetchhole     = query.value(2).toString() == "样本孔" ? "9" : query.value(2).toString();
        QString rhole     = query.value(3).toString() == "PCR孔" ? "10" : query.value(3).toString();
        QString mwv     = query.value(4).toString();
        QString mixnum     = query.value(5).toString();
        QString tip     = query.value(6).toString() == "否" ? "0" : "1";

        ch1.Param_two = step.toShort();
        ch1.Param_three = fetchhole.toShort();
        ch1.Param_four = rhole.toShort();
        ch1.Param_five = mwv.toShort();
        ch1.Param_six = mixnum.toShort();
        ch1.Param_seven = tip.toShort();
    }
    else
    {
        qDebug()<<"vvv";
    }
    ch1.Param_one = ch.toShort();
    qDebug()<<"ch1="<<ch1.Param_one << ch1.Param_two <<ch1.Param_three
           << ch1.Param_four<<ch1.Param_five<<ch1.Param_six<<ch1.Param_seven;
    UICmd(CMD_ChStartRun,(const CmdParam *)&ch1,1);
}

void UiAdaptor::selfInspection()
{
    UICmd(CMD_SelfTest,0,0);
}
void UiAdaptor::chSearchSuccess()
{
    UICmd(CMD_ChSearchOK,0,0);
}

void UiAdaptor::axisToStart(QVariantList axis)
{
    CmdParam axisstart;

    axisstart.Param_one = axis[0].toString().toShort();
    axisstart.Param_two = axis[1].toString().toShort();
    axisstart.Param_three = axis[2].toString().toShort();
    axisstart.Param_four = axis[3].toString().toShort();
    axisstart.Param_five = axis[4].toString().toShort();

    UICmd(CMD_AxisStart,(const CmdParam *)&axisstart,1);
}

void UiAdaptor::axisToInit(QVariantList axisin)
{
    CmdParam init;

    init.Param_one = axisin[0].toString().toShort();
    init.Param_two = axisin[1].toString().toShort();
    UICmd(CMD_AxisInit,(const CmdParam *)&init,1);
}

void UiAdaptor::axisToStop(QVariantList axisst)
{
    CmdParam stop;

    stop.Param_one = axisst[0].toString().toShort();
    stop.Param_two = axisst[1].toString().toShort();
    UICmd(CMD_AxisStop,(const CmdParam *)&stop,1);
}

void UiAdaptor::zsbToInit()
{
    UICmd(CMD_debug_ramPumpinit,0,0);
}

void UiAdaptor::zsbToStart(QVariantList zsb)
{
    CmdParam zsbParam;

    zsbParam.Param_one = zsb[0].toString().toShort();
    zsbParam.Param_two = zsb[1].toString().toShort();
    zsbParam.Param_three = zsb[2].toString().toShort();

    UICmd(CMD_debug_ramPumpstart,(const CmdParam *)&zsbParam,1);
}

void UiAdaptor::zsbToStop()
{
    UICmd(CMD_debug_ramPumpstop,0,0);
}

void UiAdaptor::saveTech(QVariantList tech)
{
    RecTech rst;
    rst.techname = tech[0].toString();
    rst.steps = tech[1].toString();
    rst.fetchhole = tech[2].toString();
    rst.rhole = tech[3].toString();
    rst.mwv = tech[4].toString();
    rst.mixnum = tech[5].toString();
    rst.tip = tech[6].toString();

    DataStorage::getInstance().saveRec(&rst,TECH_TB);
}

void UiAdaptor::delTech(QString value)
{
    RecTech rst;
    rst.steps = value;

    DataStorage::getInstance().delRst(&rst,TECH_TB);
}

//保存用户名设置
void UiAdaptor::saveNameParam(QVariantList nameParma)
{
    RecName rst;
    rst.permiss = nameParma[0].toString();
    rst.name = nameParma[1].toString();
    rst.passwd = nameParma[2].toString();

    DataStorage::getInstance().saveRec(&rst,NAME_TB);
}

//删除某个用户名
void UiAdaptor::delNameParam(QString name)
{
    RecName rst;
    rst.name = name;

    DataStorage::getInstance().delRst(&rst,NAME_TB);
}

void UiAdaptor::findUserName()
{
    QList<QString> list;
    QSqlQuery query;

    query.exec( QString("select DISTINCT name from NameDataTb where permiss = '%1'").arg("操作者"));
    QSqlRecord rec = query.record();

    while(query.next())
    {
        rec = query.record();
        int snocol = rec.indexOf("name");
        QString value = query.value(snocol).toString();
        list.prepend(value);
    }

    emit userNameSignal(list);
}

//登录校验
void UiAdaptor::loginCRC(QVariantList name)
{
    QString username = name[0].toString();
    QString passwd = name[1].toString();

    QList<QString> namelist;

    QString S =QString("select * from NameDataTb where name='%1' and passwd='%2' ")
            .arg(username).arg(passwd);

    QSqlQuery query;

    if(query.exec(S)&&query.next())
    {
        query.exec( QString("SELECT * from NameDataTb where name='%1'")
                    .arg( username));

        if (query.next())
        {
            int cnt = 0;
            QString Sperm     = query.value(cnt++).toString();
            QString Sname     = query.value(cnt++).toString();
            QString Spasswd     = query.value(cnt++).toString();

            namelist << Sperm << Sname << Spasswd;
            qDebug()<<"++++"<<Sperm<< Sname << Spasswd;
        }
        emit loginSucceed(namelist);

    }else
        emit loginFailed();
}

QVariantList UiAdaptor::selectAllTech()
{
    QVariantList list;
    list.clear();

    QSqlQuery query;
    query.exec("select DISTINCT techname from TechTable");
    QSqlRecord rec = query.record();
    while(query.next())
    {
        rec = query.record();
        int snocol = rec.indexOf("techname");
        QString value = query.value(snocol).toString();
        list.prepend(value);
    }
    return list;
}

void UiAdaptor::delTechOne(QString name)
{
    QSqlQuery query;
    query.exec( QString("DELETE from TechTable where techname='%1'").arg( name ));
}

void UiAdaptor::pdfDrawForm(QPainter* paint,int y,int horzBorder,int row,int column,int unitHeight,QFont &font,QStringList& list)
{
    paint->setFont(font);

    paint->setPen(QPen(QBrush(QColor(0,0,0)),2));

    int Width = paint->viewport().width()-horzBorder*2;

    int unitWidth = Width/column;

    for(int i=0;i<row;i++)
    {
        int x= horzBorder;

        for(int j=0;j<column;j++)
        {
            paint->drawText(QRect(x,y, unitWidth, unitHeight), Qt::AlignCenter,list[i*column+j]);

            paint->drawRect(QRect(x,y, unitWidth, unitHeight));

            x+=unitWidth;
        }

        y += unitHeight;
    }
}

void UiAdaptor::savePdf(QVariantList pdfParam)
{
    QString file_path =QString("./PDF/%1").arg(QDateTime::currentDateTime().toString("yyyy-MM-dd_hh-mm-ss") +
                                               "_"+pdfParam[3].toString()+"_"+pdfParam[2].toString() +".pdf");
    QFile pdfFile(file_path);
    pdfFile.open(QIODevice::WriteOnly);
    QPdfWriter* pWriter = new QPdfWriter(&pdfFile);

    //Init Page
    pWriter->setPageSize(QPagedPaintDevice::A4);
    pWriter->setResolution(300);    //设置dpi 每个平方英寸像素为300
    pWriter->setPageMargins(QMarginsF(30, 30, 30, 30));

    QPainter* pPainter = new QPainter(pWriter);

    //Init Font
    QFont font[7]={QFont("微软雅黑",26,60),QFont("微软雅黑",26,61),QFont("微软雅黑",26,QFont::Normal),
                   QFont("微软雅黑",26,QFont::Normal),QFont("微软雅黑",26,QFont::Normal),QFont("微软雅黑",26,QFont::Bold)
                   ,QFont("微软雅黑",26,QFont::Normal)};
    font[0].setPixelSize(86);
    font[1].setPixelSize(61);
    font[2].setPixelSize(61);
    font[3].setPixelSize(42);
    font[4].setPixelSize(54);
    font[5].setPixelSize(48);
    font[6].setPixelSize(30);

    //Painter PDF
    qDebug()<<pPainter->viewport();
    int nPDFWidth = pPainter->viewport().width();
    int nPDFHeight = pPainter->viewport().height();


    //在10%的头部居中显示
    int y=100;
    pPainter->setFont(font[0]);
    pPainter->drawText(QRect(0,y, nPDFWidth, 100), Qt::AlignLeft | Qt::AlignVCenter,
                       QString("细胞工艺运行报告"));

    pPainter->setFont(font[6]);
    pPainter->drawText(QRect(0,nPDFHeight-50, nPDFWidth, 100), Qt::AlignRight| Qt::AlignVCenter,
                       QString("1"));

    std::string titleImageFileName = ":/res/sinobiacan.png";
    QPixmap titleImage;
    titleImage.load(QString::fromStdString(titleImageFileName));
    pPainter->drawPixmap(1500, -50, titleImage.width(), titleImage.height(), titleImage);


    y+=140;
    pPainter->setPen(QPen(QBrush(QColor(0,0,0)),5));
    pPainter->drawLine(0,y,nPDFWidth,y);

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0, nPDFHeight-300, nPDFWidth/3, 80),
                       QString("签名:"));

    pPainter->drawLine(200, nPDFHeight-200, nPDFWidth/2-200, nPDFHeight-200);
    pPainter->drawLine(nPDFWidth/2+200, nPDFHeight-200, nPDFWidth-200, nPDFHeight-200);

    pPainter->setFont(font[4]);
    pPainter->drawText(QRect(200, nPDFHeight-200, nPDFWidth/2, 80),
                       QString("报告生成人          名字/日期"));
    pPainter->drawText(QRect(nPDFWidth/2+200, nPDFHeight-200, nPDFWidth/2, 80),
                       QString("报告审核人          名字/日期"));

    y+=80;

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0,y, nPDFWidth/2, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("工艺名称:  %1").arg(pdfParam[2].toString()));

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(nPDFWidth/2,y, nPDFWidth/2-100, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("当前用户:  %1").arg(pdfParam[3].toString()));

    y+=150;

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0,y, nPDFWidth/2, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("耗材编号:  %1"));

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(nPDFWidth/2,y, nPDFWidth/2-100, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("设备ID:  %1"));

    y+=150;

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0,y, nPDFWidth/2, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("开始时间:  %1").arg(pdfParam[0].toString()));

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(nPDFWidth/2,y, nPDFWidth/2-100, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("结束时间:  %1").arg(QDateTime::currentDateTime().toString("hh:mm:ss")));

    y+=150;

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0,y, nPDFWidth/2, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("系统版本:  %1").arg(pdfParam[4].toString()));

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(nPDFWidth/2,y, nPDFWidth/2-100, 70), Qt::AlignVCenter | Qt::AlignLeft,
                       QString("报告日期:  %1").arg(QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss")));
    QList<QString> initSample;
    QSqlQuery query;

    query.exec( QString("SELECT * from InitDataTb where proName='%1'")
                .arg( pdfParam[2].toString()));
    if (query.next())
    {
        int cnt = 1;
        QString sampCode     = query.value(cnt++).toString();
        QString sampVolume     = query.value(cnt++).toString();
        QString manualcollect     = query.value(cnt++).toString();
        QString backWash            =query.value(cnt++).toString();
        initSample << sampCode << sampVolume << manualcollect<<backWash;
    }

    y+=200;


    QStringList list;
    list<<"输入参数名称"<<"输入参数值"<<"输入参数名称"<<"输入参数值";
    // 还可以设置填充颜色
    pdfDrawForm(pPainter,y,0,1,4,100,font[5],list);

    y+=100;

    QStringList initlist;
    initlist<<"实验编号"<<initSample.at(0)<<"实验容量(g)"<<initSample.at(1)
           <<"手动收集"<<initSample.at(2)<<"是否回冲"<<initSample.at(3);

    pdfDrawForm(pPainter,y,0,initlist.count()/4,4,100,font[3],initlist);

    y+=200+initlist.count()/3*100;

    pWriter->newPage();
    //在10%的头部居中显示
    int y1=100;
    pPainter->setFont(font[0]);
    pPainter->drawText(QRect(0,y1, nPDFWidth, 100), Qt::AlignLeft | Qt::AlignVCenter,
                       QString("细胞工艺运行报告"));

    std::string titleImage2FileName = ":/res/sinobiacan.png";
    QPixmap titleImage2;
    titleImage2.load(QString::fromStdString(titleImage2FileName));
    pPainter->drawPixmap(1500, -50, titleImage2.width(), titleImage2.height(), titleImage2);


    y1 +=140;
    pPainter->setPen(QPen(QBrush(QColor(0,0,0)),5));
    pPainter->drawLine(0,y1,nPDFWidth,y1);

    y1 += 100;
    list.clear();
    list<<"运行结果"<<"参数值"<<"运行结果"<<"参数值";
    // 还可以设置填充颜色
    pdfDrawForm(pPainter,y1,0,1,4,100,font[5],list);

    y1+=100;

    list.clear();
    list<<"终产品(g)"<<pdfParam[5].toString()<<"工艺效率"<<pdfParam[6].toString()
       <<"第一袋产品(g)"<<pdfParam[7].toString()<<"第二袋产品(g)"<<pdfParam[8].toString()
      <<"第三袋产品(g)"<<pdfParam[9].toString()<<"第四袋产品(g)"<<pdfParam[10].toString();
    pdfDrawForm(pPainter,y1,0,list.count()/4,4,100,font[3],list);

    y1 +=200+list.count()/4*100;
    std::string pressureImageFileName = "./pressure.png";
    QPixmap pressureImage;
    pressureImage.load(QString::fromStdString(pressureImageFileName));
    pPainter->drawPixmap(0, y1, pressureImage.width(), pressureImage.height(), pressureImage);

    pPainter->setFont(font[2]);
    pPainter->drawText(QRect(0, nPDFHeight-300, nPDFWidth/3, 80),
                       QString("签名:"));

    pPainter->drawLine(200, nPDFHeight-200, nPDFWidth/2-200, nPDFHeight-200);
    pPainter->drawLine(nPDFWidth/2+200, nPDFHeight-200, nPDFWidth-200, nPDFHeight-200);

    pPainter->setFont(font[4]);
    pPainter->drawText(QRect(200, nPDFHeight-200, nPDFWidth/2, 80),
                       QString("报告生成人          名字/日期"));
    pPainter->drawText(QRect(nPDFWidth/2+200, nPDFHeight-200, nPDFWidth/2, 80),
                       QString("报告审核人          名字/日期"));

    pPainter->setFont(font[6]);
    pPainter->drawText(QRect(0,nPDFHeight-50, nPDFWidth, 100), Qt::AlignRight| Qt::AlignVCenter,
                       QString("2"));
    //绘制完毕
    delete pPainter;
    delete pWriter;
    pdfFile.close();
    qDebug("Make done");
}

void UiAdaptor::copyPdf(QString name)
{
    QString mou = QString("sudo cp /home/pi/PDF/%1 /home/pi/cache/").arg(name);
    system(mou.toLatin1().data());
}

void UiAdaptor::delPdf(QString name)
{
    QString mou = QString("sudo rm /home/pi/cache/%1").arg(name);
    system(mou.toLatin1().data());
}

void UiAdaptor::copyToUSB()
{
    QDir dirusb("/home/pi/usb/");
    QDir dircache("/home/pi/cache/");
    if(dirusb.count()==2){
        qDebug()<<dirusb.count();
        emit usbIsNull();
    }else if(dircache.count()==2)
    {
        qDebug()<<dircache.count();
        emit cacheIsNull();
    }else
    {
        system("sudo cp /home/pi/cache/* /home/pi/usb/");
        emit copySuccee();
    }
}

void UiAdaptor::clearDataPdf()
{

}

void UiAdaptor::changeOperatorPWD(QVariantList cpwd)
{
    QString username = cpwd[0].toString();
    QString passwd = cpwd[1].toString();

    QSqlQuery query;
    query.exec( QString("update NameDataTb set passwd = '%1' WHERE name = '%2' ")
                .arg(passwd).arg(username));

    if ( query.lastError().isValid() )
    {
        qDebug()<< query.lastError().text();
        emit cpwdError();
    }
    else
    {
        emit cpwdSucceed();
    }
}

void UiAdaptor::updateReadme()
{
    system("sudo rm -r /home/pi/upda*");
    system("sudo cp /home/pi/usb/update.tar.gz /home/pi");
    system("sudo tar -zxvf /home/pi/update.tar.gz");

    QFile file("./update/Readme.txt");
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        emit noReadme();
    }else{
        QByteArray t = file.readAll();
        //        QString txt = QString(t);
        QString version = QString(t).mid(3,6);
        if( version > CurVerison)
        {
            emit updateReadmeSignal(QString(t));
            qDebug()<<QString(t);
            file.close();
        }else{
            emit curVersionNew();
            file.close();
        }
    }
}

void UiAdaptor::updateSoft()
{
    system("sudo cp /home/pi/update/CellSep /home/pi/PDF");
}

void UiAdaptor::saveAlarm(QVariantList alarm)
{
    //报警存储
    RecLog alm;
    alm.username = alarm[0].toString();
    alm.project    = alarm[1].toString();
    alm.starttime      = QDateTime::currentDateTime();
    alm.alarmstr      = alarm[2].toString();

    DataStorage::getInstance().saveRec( &alm,LOG_TB );
}













