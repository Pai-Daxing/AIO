/***********************************************************************
* logdata.cpp
* Copyright all resever(2018)
*
* 采集结果记录数据库表类
*
* Author              Date               Action
* lilice              2018/11/07           create
*
***********************************************************************/
#include "logdata.h"

LogTable::LogTable( QString strName  ):
    DBTable( strName )
{

}

bool LogTable::create()
{
    QSqlQuery query;

    query.exec("select * from " + getTableName());

    if ( query.lastError().isValid() && QSqlError::StatementError == query.lastError().type() )
    {
        query.exec("create table " +getTableName()+
                   "( username varchar, "
                   "project varchar, "
                   "starttime varchar, "
                   "alarmstr varchar )");
    }
//        else
//        {
//            // 每次开机清理一遍6个月前的记录
//            QDateTime curDt = QDateTime::currentDateTime();
//            query.exec( QString("DELETE from "+ getTableName() +" where time < '%1' ")
//                        .arg(curDt.addMonths( -LOG_MONTH ).toString("yyyy-MM-dd hh:mm")) );
//        }

    return !( query.lastError().isValid() );
}

bool LogTable::addRec(void* rec)
{
    RecLog *pRec = (RecLog*)rec;
//    int order = getOrder();
//    pRec->order = QString::number(order);

    QSqlQuery query;
    query.prepare("INSERT INTO " +getTableName()+
                  "(username, "
                  "project, "
                  "starttime, "
                  "alarmstr )"
                  "VALUES(:username, "
                  ":project, "
                  ":starttime, "
                  ":alarmstr )");

    query.bindValue(":username",    pRec->username);
    query.bindValue(":project",   pRec->project );
    query.bindValue(":starttime", pRec->starttime.toString("yyyy-MM-dd hh:mm:ss") );
    query.bindValue(":alarmstr",    pRec->alarmstr);
    query.exec();

    if ( query.lastError().isValid() )
    {
        qDebug()<< query.lastError().text();
        qDebug()<< "write Db failed";
    }
    else
    {
        qDebug()<< "write Db done";
    }
    return !(query.lastError().isValid());
}

bool LogTable::updateRec(void* rec)
{
    Q_UNUSED(rec)

    return false;
    //    RecLog *pRec = (RecLog*)rec);
    //    QSqlQuery query;

    //    QString cmd =  QString("UPDATE " + getTableName() + " set status='%1' "
    //                           + " WHERE code='%2' ")
    //            .arg( pRec->status).arg( pRec->code);

    //    query.exec( cmd );

    //    return !(query.lastError().isValid());
}

bool LogTable::delRec(void* rec)
{
    Q_UNUSED(rec)

    return false;

    //    RecSample *pRec = dynamic_cast<RecSample*>(rec);
    //    QSqlQuery query;

    //    QString strCmd = QString("DELETE from "+ getTableName() +" where code='%1' ")
    //            .arg( pRec->code);

    //    query.prepare( strCmd );
    //    query.exec();

    //    qDebug() << query.lastError();
    //    return !(query.lastError().isValid());
}

bool LogTable::delRec( QDateTime /*dt1*/, QDateTime /*dt2*/ )
{
    return true;
    //    QSqlQuery query;

    //    query.prepare( QString("DELETE from "+ getTableName() +" where time between '%1' and '%2' ")
    //                   .arg(dt1.toString("yyyy-MM-dd hh:mm")).arg(dt2.toString("yyyy-MM-dd hh:mm")) );
    //    query.exec();

    //    return !(query.lastError().isValid());
}

/// \brief LogTable::queryRec
/// 优先查询donorCode,如果为空则以id为条件，二者均为空则返回空结果
/// \param donorCode
/// \param id
/// \return
///
QLinkedList<RecLog> * LogTable::queryRec(QString project)
{
    QLinkedList<RecLog> *ret = new QLinkedList< RecLog >;
    QSqlQuery query;

    if (!project.isEmpty()){
        query.exec( QString("SELECT * from " + getTableName() + " where project='%1' ")
                    .arg( project ) );
    }
    else {
        query.exec( QString("SELECT * from " + getTableName() ));
    }

    while (query.next())
    {
        int cnt = 0;
        RecLog rec;

        rec.username     = query.value(cnt++).toString();
        rec.project   = query.value(cnt++).toString();
        rec.starttime = QDateTime::fromString(query.value(cnt++).toString(), "yyyy-MM-dd hh:mm:ss");
        rec.alarmstr      = query.value(cnt++).toString();
        *ret << rec;
    }

    return ret;
}

int LogTable::getOrder()
{
    QSqlQuery query;
    int retVal = 0;
    query.exec( QString("SELECT * from " + getTableName() ));

    if ( query.last() ){
       retVal = query.value(0).toString().toInt() + 1;
    }

    return retVal;
}
