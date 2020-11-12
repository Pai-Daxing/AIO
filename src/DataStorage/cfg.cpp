#include "cfg.h"
#include <QDebug>
#include <QTextCodec>

Cfg::Cfg(QObject *parent) :
    QObject(parent)
{
    m_pCfgSetting = new QSettings( PLASMA_SET_FILE, QSettings::IniFormat );
    m_pCfgSetting->setIniCodec( QTextCodec::codecForName("GB2312") );
    m_Hash.insert( CFG_HoleMask,           "HOLE" );
    m_Hash.insert( CFG_CurOptName,         "opt" );
    m_Hash.insert( CFG_CurChkName,         "Check" );
    m_Hash.insert( CFG_Days,               "Setting/Days" );
    m_Hash.insert( CFG_LastPatch,          "LastPatch" );
    m_Hash.insert( CFG_Prefix,             "Setting/Prefix" );
    m_Hash.insert( CFG_COM,                "COM" );
    m_Hash.insert( CFG_BRate,              "BRate" );
    m_Hash.insert( CFG_BarC_X,             "Setting/BarCode_x" );
    m_Hash.insert( CFG_BarC_Y,             "Setting/BarCode_y" );
    m_Hash.insert( CFG_BarC_H,             "Setting/BarCode_H" );
    m_Hash.insert( CFG_BarC_W,             "Setting/BarCode_Width" );
    m_Hash.insert( CFG_BarC_Type,          "Setting/BarCode_Type" );
}

Cfg& Cfg::getInst()
{
    static Cfg obj;
    return obj;
}

QString  Cfg::getUsrCfgStr( CFGSETTING id )
{
    QString strID = m_Hash.value( id );
    return m_pCfgSetting->value( strID, QVariant(QString("")) ).toString();
}

void Cfg::setUsrCfgStr( CFGSETTING id, QString value )
{
    QString strID = m_Hash.value( id );
    m_pCfgSetting->setValue( strID, QVariant( value ) );
}


void Cfg::setServerName( SrvName index )
{
    QString name;
    switch ( index )
    {
    default:
    case LANGCHENG:
        name = "LangCheng";
        break;
    }

    m_pCfgSetting->setValue( "Network/serverName", QVariant( name ) );
}

SrvName  Cfg::getServerName( )
{
    SrvName ret = LANGCHENG;

    QString str = m_pCfgSetting->value( "Network/serverName", QVariant(QString("")) ).toString();

    if  ( "LangCheng" == str )
    {
        ret = LANGCHENG;
    }

    return ret;
}
