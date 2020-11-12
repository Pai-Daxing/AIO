#include "alarmmgr.h"
#include "alarmstr.h"
#include "../DataStorage/datastorage.h"
#include"../DataStorage/datamgr.h"
//#include </home/slrom/qtworks/led/wiringPi/wiringPi.h>
#include <qdatetime.h>

const AlarmInfo AlarmMgr::m_sAlarmInfoTable[AlmType_MAX] = {
    //类型                       级别                   栓锁
    {ALM_none,                  AlmLev_none,     Alalat_none},
    {ALM_ComError,              AlmLev_high,     ALARM_AUTOB},
    {ALM_SelfZcanfail,          AlmLev_high,     ALARM_AUTOB},
    {ALM_SelfYcanfail,          AlmLev_high,     ALARM_AUTOB},
    {ALM_SelfXcanfail,          AlmLev_high,     ALARM_AUTOB},
    {ALM_SelfRampumpfail,       AlmLev_high,     ALARM_AUTOB},
    {ALM_PutWBOXfail,           AlmLev_high,     ALARM_AUTOB},
    {ALM_CloseWBOXfail,         AlmLev_high,     ALARM_AUTOB},



    {EC_TEMP1_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP2_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP3_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP4_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP5_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP6_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP7_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP8_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP9_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP10_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP11_F,        AlmLev_high,     ALARM_LATCH},//
    {EC_TEMP12_F,        AlmLev_high,     ALARM_LATCH},//
};

AlarmMgr::AlarmMgr(QObject *parent) :
    QObject(parent),
    m_curType(ALM_none)
{
}

void AlarmMgr::init(QObject *sender)
{
    connect(sender, SIGNAL(setAlarmType(qint16)), this, SLOT(onSetAlarmType(qint16)));

    qRegisterMetaType<AlarmInfo>( );
    connect(this, SIGNAL(triggerAlarm(AlarmInfo)), this, SLOT(onTriggerAlarm(AlarmInfo)));
    connect(this, SIGNAL(cancelAlarm(AlarmInfo)), this, SLOT(onCancelAlarm(AlarmInfo)));
}

AlarmMgr& AlarmMgr::getInstance()
{
    static AlarmMgr instance;
    return instance;
}

void AlarmMgr::onSetAlarmType(qint16 newType)  //报警类型
{
    qint16  curType = (qint16)m_curType;
    if (newType != curType)
    {
        m_curType = (AlarmType)newType;
        if (ALM_none == m_curType)
        {   //清除当前报警
            emit cancelAlarm(m_sAlarmInfoTable[curType]);
        }
        else
        {   //触发新报警
            emit triggerAlarm(m_sAlarmInfoTable[newType]);
        }
    }
}

void AlarmMgr::onTriggerAlarm(const AlarmInfo &info)
{
//    //报警存储
//    AlarmRec alm;
//    alm.time    = QDateTime::currentDateTime();
//    alm.mid     = DataMgr::getInst().getUsrCfgStr(CFG_devID);
//    alm.str      = AlarmString::getInstance().getStr( info.type ); ;
//    alm.action = 1;

//    DataStorage::getInstance().saveData( alm );
}

void AlarmMgr::onCancelAlarm(const AlarmInfo &info)
{
//    //报警存储
//    AlarmRec alm;
//    alm.time    = QDateTime::currentDateTime();
//    alm.mid     = DataMgr::getInst().getUsrCfgStr(CFG_devID);
//    alm.str      = AlarmString::getInstance().getStr( info.type ); ;
//    alm.action = 0;
//    pinMode(7,OUTPUT);
//    digitalWrite(7,HIGH);

//    DataStorage::getInstance().saveData( alm );

}

