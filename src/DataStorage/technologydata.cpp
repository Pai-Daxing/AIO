#include "technologydata.h"

Technologydata::Technologydata(QString strName ):
    DBTable( strName )
{

}

bool Technologydata::create()
{
    QSqlQuery query;

    query.exec("select * from " + getTableName());

    if ( query.lastError().isValid() && QSqlError::StatementError == query.lastError().type() )
    {
        query.exec("create table " +getTableName()+
                   "( techname varchar, "
                   "steps varchar, "
                   "fetchhole varchar, "
                   "rhole varchar, "
                   "mwv varchar, "
                   "mixnum varchar, "
                   "tip varchar )");
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

bool Technologydata::addRec(void* rec)
{
    RecTech *pRec = (RecTech*)rec;
    if ( findDuplicateRec( *pRec ) )
    {
        updateRec(rec);
    }else
    {
        QSqlQuery query;
        query.prepare("INSERT INTO " +getTableName()+
                      "(techname, "
                      "steps, "
                      "fetchhole, "
                      "rhole, "
                      "mwv, "
                      "mixnum, "
                      "tip )"
                      "VALUES(:techname, "
                      ":steps, "
                      ":fetchhole, "
                      ":rhole, "
                      ":mwv, "
                      ":mixnum, "
                      ":tip )");

        query.bindValue(":techname",    pRec->techname);
        query.bindValue(":steps",   pRec->steps );
        query.bindValue(":fetchhole", pRec->fetchhole);
        query.bindValue(":rhole",    pRec->rhole);
        query.bindValue(":mwv", pRec->mwv);
        query.bindValue(":mixnum", pRec->mixnum);
        query.bindValue(":tip",    pRec->tip);
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
}

bool Technologydata::updateRec(void* rec)
{
    RecTech *pRec = (RecTech*)rec;
    QSqlQuery query;

    QString cmd =  QString("UPDATE " + getTableName() + " set techname='%1', "
                                                        " fetchhole='%2', "
                                                        " rhole='%3', "
                                                        " mwv='%4', "
                                                        " mixnum='%5', "
                                                        " tip='%6' "
                           + " WHERE steps='%7' ")
            .arg( pRec->techname)
            .arg( pRec->fetchhole)
            .arg( pRec->rhole)
            .arg( pRec->mwv)
            .arg( pRec->mixnum)
            .arg( pRec->tip)
            .arg( pRec->steps);

    query.exec( cmd );

    if ( query.lastError().isValid() )
    {
        qDebug()<< query.lastError().text();
        qDebug()<< "update Db failed";
    }
    else
    {
        qDebug()<< "update Db done";
    }

    return !(query.lastError().isValid());
}

bool Technologydata::delRec(void* rec)
{
    RecTech *pRec = (RecTech*)rec;
    QSqlQuery query;

    QString strCmd = QString("DELETE from "+ getTableName() +" where steps='%1' ")
            .arg( pRec->steps);

    query.prepare( strCmd );
    qDebug()<< "delRec2";
    query.exec();

    qDebug() << query.lastError();
    return !(query.lastError().isValid());
}

/// \brief LogTable::queryRec
/// 优先查询donorCode,如果为空则以id为条件，二者均为空则返回空结果
/// \param donorCode
/// \param id
/// \return
///
QLinkedList<RecTech> * Technologydata::queryRec(QString steps, QString techname)
{
    QLinkedList<RecTech> *ret = new QLinkedList< RecTech >;
    QSqlQuery query;

    if (!steps.isEmpty()){
        query.exec( QString("SELECT * from " + getTableName() + " where steps='%1' and techname='%2' ")
                    .arg( steps )
                    .arg( techname ) );
    }
    else {
        query.exec( QString("SELECT * from " + getTableName() ));
    }

    while (query.next())
    {
        int cnt = 0;
        RecTech rec;

        rec.techname     = query.value(cnt++).toString();
        rec.steps   = query.value(cnt++).toString();
        rec.fetchhole = query.value(cnt++).toString();
        rec.rhole      = query.value(cnt++).toString();
        rec.mwv        = query.value(cnt++).toString();
        rec.mixnum = query.value(cnt++).toString();
        rec.tip      = query.value(cnt++).toString();
        *ret << rec;
    }

    return ret;
}

bool Technologydata::findDuplicateRec(const RecTech&rec)
{
    bool ret = false;
    QLinkedList< RecTech > *recList = queryRec( rec.steps, rec.techname);

    if (recList->count() > 0)
        ret = true;

    delete recList;
    recList = 0;

    return ret;
}
