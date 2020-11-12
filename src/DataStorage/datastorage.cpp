/***********************************************************************
* datastorage.cpp
* Copyright(2013) all rights resever
* 创建DataStorage类，保存采浆机发送过来的结果数据
*
* Author              Date               Action
* lilice              2013/5/3           create
* lilice              2015/12/17       modified
*
***********************************************************************/
#include "datastorage.h"
#include <QtGui>
#include <QtSql>
#include <QDebug>

DataStorage::DataStorage(QObject *parent) :
    QObject(parent)
{
}

DataStorage::~DataStorage()
{

}

/***********************************************************************
* 初始化数据存储模块，建立数据库 PlasmaDb，建立表格resultTb、dpTb
*
*
* Author              Date               Action
* lilice               2013/1/28          create
*  lilice              2015/11/17        modified
***********************************************************************/
bool DataStorage::init()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName( "./Datas/AIOdb" );

    if (!db.open())
    {
        qDebug("Cannot open database");
        return false;
    }

    return initDbTable();
}

// 分别创建采集结果三张表格
bool DataStorage::initDbTable()
{
    bool ret = true;

    m_pName = new NameData("NameDataTb");
    if ( 0 == m_pName)    {
        return false;
    }
    ret = m_pName->create();

    m_pLogTb = new LogTable("LogTable");
    if ( 0 == m_pLogTb)    {
        return false;
    }
    ret = m_pLogTb->create();

    m_pTechTb = new Technologydata("TechTable");
    if ( 0 == m_pTechTb)    {
        return false;
    }
    ret = m_pTechTb->create();

    return ret;
}

DBTable *DataStorage::getTbPointer(TABLETYPE type)
{
    DBTable *pTb = NULL;
    switch( type )
    {
    case NAME_TB:
        pTb = (DBTable *)m_pName;
        break;
    case LOG_TB:
        pTb = (DBTable *)m_pLogTb;
        break;
    case TECH_TB:
        pTb = (DBTable *)m_pTechTb;
        break;
    default:
        Q_ASSERT(0);
        break;
    }

    return pTb;
}

QString DataStorage::getTableName( TABLETYPE type )
{
    QString str = "";
    DBTable *pTb = getTbPointer(type);

    if ( NULL != pTb )
    {
        str = pTb->getTableName();
    }

    return str;
}

//// 保存到数据库对应表格的接口

bool DataStorage::saveRec(void* rec, TABLETYPE type)
{
    DBTable *pTb = getTbPointer(type);

    if ( pTb && pTb->addRec( rec ) )    {
        return true;
    }

    return false;
}

//// 删除对应数据库表格记录的接口
bool DataStorage::delRst(void* rst, TABLETYPE type)
{
    DBTable *pTb = getTbPointer(type);

    if ( pTb&&pTb->delRec( rst ) )
    {
        return true;
    }
    return false;
}


//// 查询对应数据库表格记录的接口
//QLinkedList< RecExam > *DataStorage::getExamData( QDateTime dt1, QDateTime dt2 )
//{
//    Q_ASSERT( m_pExamDataTb );

//    return m_pExamDataTb->queryRec( dt1, dt2 );
//}

void* DataStorage::getData( TABLETYPE type, QDateTime /*dt1*/, QDateTime /*dt2*/ )
{
    switch( type )
    {
    case NAME_TB:
        return (void*)m_pName->queryRec("");
        break;
    case LOG_TB:
        return (void*)m_pLogTb->queryRec("");
        break;
    case TECH_TB:
        return (void*)m_pTechTb->queryRec("","");
        break;
    default:
        Q_ASSERT(0);
        break;
    }
}

void* DataStorage::getData(TABLETYPE type, QString strVal, QString strVal1)
{
    switch( type )
    {
    case NAME_TB:
        return (void*)m_pName->queryRec(strVal);
        break;
    case LOG_TB:
        return (void*)m_pLogTb->queryRec(strVal);
        break;
    case TECH_TB:
        return (void*)m_pTechTb->queryRec(strVal,strVal1);
        break;
    default:
        Q_ASSERT(0);
        break;
    }
}

bool DataStorage::updateRec( void* rec, TABLETYPE type )
{
    bool  retVal = false;
    DBTable *pTb = getTbPointer(type);
    retVal = pTb && pTb->updateRec( rec );

    return retVal;
}
