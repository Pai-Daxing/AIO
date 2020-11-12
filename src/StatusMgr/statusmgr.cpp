#include "statusmgr.h"
#include "../ParamMgr/parammgr.h"
#include "../SerialApp/serialapp.h"
#include "../DataStorage/datamgr.h"

StatusMgr::StatusMgr(QObject *parent):
    QObject(parent),
    m_curStatus(CSS_unknown),
    m_preStatus(CSS_unknown),
    m_workingStatus( WS_BUSY ),
    mSTErrNo(0),
    mbIsQuitDraw(false)
{

}

void StatusMgr::init(QObject *sender)
{
    connect(sender, SIGNAL(setCtrlSysStatus(qint16)),\
            this, SLOT(onSetControlSystemStatus(qint16)));
    connect(sender, SIGNAL(setErrNo(qint16)),\
            this, SLOT(updateErrNo(qint16)));
    connect(this, SIGNAL(controlSystemStatusChanged(qint16)),\
            this, SLOT(onControlSystemStatusChanged(qint16)));
}

StatusMgr& StatusMgr::getInstance()
{
    static StatusMgr instance;
    return instance;
}

void StatusMgr::updateErrNo(qint16 no)
{
    if (no > EC_MAX || no < 0)
        no = 0;

    mSTErrNo = no;
}

QString StatusMgr::getErrStr()
{
    static TestErrMsg s[]={
        {EC_NONE, tr("")},
//        {EC_TEMP1_F, tr("1号温度传感器异常")},
//        {EC_TEMP2_F, tr("2号温度传感器异常")},
//        {EC_TEMP3_F, tr("3号温度传感器异常")},
//        {EC_TEMP4_F, tr("4号温度传感器异常")},
//        {EC_TEMP5_F, tr("5号温度传感器异常")},
//        {EC_TEMP6_F, tr("6号温度传感器异常")},
//        {EC_TEMP7_F, tr("7号温度传感器异常")},
//        {EC_TEMP8_F, tr("8号温度传感器异常")},
//        {EC_TEMP9_F, tr("9号温度传感器异常")},
//        {EC_TEMP10_F, tr("10号温度传感器异常")},
//        {EC_TEMP11_F, tr("11号温度传感器异常")},
//        {EC_TEMP12_F, tr("12号温度传感器异常")}
    };

    QString str = "";
    for (int i = 0; i < EC_MAX; i++){
        if (s[i].code == mSTErrNo)
            str = s[i].str;
    }
    return str;
}

void StatusMgr::onSetControlSystemStatus(qint16 newStatus)
{
    qint16 curStatus = (qint16)m_curStatus;
    if (newStatus != curStatus)
    {
        m_preStatus = m_curStatus;

        m_curStatus = (ControlSystemStatus)newStatus;
        emit controlSystemStatusChanged(newStatus);
    }
}

void StatusMgr::onControlSystemStatusChanged(qint16 newStatus)
{
    ControlSystemStatus status = (ControlSystemStatus)newStatus;
}
