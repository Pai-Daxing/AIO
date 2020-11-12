//#include "../global.h"
#include<QTimerEvent>
#include<QDebug>
#include "parammgr.h"
#include<qdatetime.h>
#include"../StatusMgr/statusmgr.h"
#include"../DataStorage/datamgr.h"
#include "../SerialApp/serialapp.h"
#include "../DataStorage/datastorage.h"
#include "../DataStorage/cfg.h"
#include <QTime>
#include <QString>
#include <stdio.h>
#include <string.h>
#include <iostream>

NIntValidator::NIntValidator(QObject *parent) :
    QIntValidator(parent)
{
}

NIntValidator::NIntValidator(int min, int max, QObject *parent) :
    QIntValidator(min, max, parent)
{

}

void NIntValidator::fixup(QString &input) const
{
    input = QString("%1").arg(bottom());
}

QValidator::State NIntValidator::validate ( QString & input, int & pos ) const
{
    if ( !input.isEmpty() )
    {
        input = QString("%1").arg( input.toInt() );
    }
    return QIntValidator::validate( input, pos );
}


ParamMgr::ParamMgr(QObject *parent) :
    QObject(parent),
    m_nTimerId(0),
    m_bSendChange(true)
{
    m_pRecRt    = new RecRTParam();
    m_IOVar.w = 0;
    m_SampleVar.w = 0;
}

ParamMgr::~ParamMgr()
{
    if (m_nTimerId != 0)
    {
        killTimer(m_nTimerId);
    }
}

void ParamMgr::init(QObject* sender)
{
    connect(sender, SIGNAL(COMStr(QString)),this,        SLOT(onComData(QString)));
    connect(sender, SIGNAL(setIO1Param(qint32)),this,        SLOT(onSetIO1Param(qint32)));
    connect(sender, SIGNAL(setIO2Param(qint32)),this,        SLOT(onSetIO2Param(qint32)));
    m_nTimerId = startTimer(1000);
}

ParamMgr* ParamMgr::getInstance()
{
    static ParamMgr *pParamMgr = 0;

    if ( NULL == pParamMgr )
    {
        pParamMgr = new ParamMgr();
    }

    return pParamMgr;
}

void ParamMgr::onSetIO1Param(qint32 newValue)
{
    IOParam_t temp;
    temp.w = newValue;

    if( temp.RamPump_backzero != m_IOVar.RamPump_backzero)
        emit signalRamPumpBackzero(temp.RamPump_backzero);
    if( temp.RamPump_TIP != m_IOVar.RamPump_TIP)
        emit signalRamPumpTIP(temp.RamPump_TIP);
    if( temp.Putwastebox != m_IOVar.Putwastebox)
        emit signalPutWasteBox(temp.Putwastebox);
    if( temp.Closewastebox != m_IOVar.Closewastebox)
        emit signalCloseWasteBox(temp.Closewastebox);
    if( temp.Ch1_putragent != m_IOVar.Ch1_putragent){
        qDebug()<<"Ch1_putragent"+m_IOVar.Ch1_putragent;
        emit signalCh1PutRagent(temp.Ch1_putragent);
    }
    if( temp.Ch2_putragent != m_IOVar.Ch2_putragent)
        emit signalCh2PutRagent(temp.Ch2_putragent);
    if( temp.Ch3_putragent != m_IOVar.Ch3_putragent)
        emit signalCh3PutRagent(temp.Ch3_putragent);
    if( temp.Ch4_putragent != m_IOVar.Ch4_putragent)
        emit signalCh4PutRagent(temp.Ch4_putragent);
    if( temp.Ch1_closeragent != m_IOVar.Ch1_closeragent)
        emit signalCh1CloseRagent(temp.Ch1_closeragent);
    if( temp.Ch2_closeragent != m_IOVar.Ch2_closeragent)
        emit signalCh2CloseRagent(temp.Ch2_closeragent);
    if( temp.Ch3_closeragent != m_IOVar.Ch3_closeragent)
        emit signalCh3CloseRagent(temp.Ch3_closeragent);
    if( temp.Ch4_closeragent != m_IOVar.Ch4_closeragent)
        emit signalCh4CloseRagent(temp.Ch4_closeragent);
    if( temp.Door_close != m_IOVar.Door_close)
        emit signalDoorClose(temp.Door_close);

    m_IOVar.w = newValue;
}

void ParamMgr::onSetIO2Param(qint32 newValue)
{
    SampleParam_t temp;
    temp.w = newValue;

    if( temp.Ch1_Sample != m_SampleVar.Ch1_Sample)
        emit signalCh1Sample(temp.Ch1_Sample);
    if( temp.Ch2_Sample != m_SampleVar.Ch2_Sample)
        emit signalCh2Sample(temp.Ch2_Sample);
    if( temp.Ch3_Sample != m_SampleVar.Ch3_Sample)
        emit signalCh3Sample(temp.Ch3_Sample);
    if( temp.Ch4_Sample != m_SampleVar.Ch4_Sample)
        emit signalCh4Sample(temp.Ch4_Sample);


    m_SampleVar.w = newValue;
}

void ParamMgr::onComData(QString str)
{
    emit COMdata(str);
}
