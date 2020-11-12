#include "namedata.h"

NameData::NameData(QString strName):
    DBTable( strName)
{

}

bool NameData::create()
{
    QSqlQuery query;
    query.exec("select * from " + getTableName());

    if( query.lastError().isValid() && QSqlError::StatementError == query.lastError().type())
    {
        query.exec("create table " + getTableName() +
                   "( permiss varchar, "
                   "name varchar, "
                   "passwd varchar )");
    }
    return !( query.lastError().isValid());
}

bool NameData::addRec(void *Rec)
{
    RecName *pRec = (RecName*)Rec;

    if ( findDuplicateRec( *pRec ) )
    {
        updateRec(Rec);
        qDebug()<<"updata";
    }else
    {
        QSqlQuery query;
        query.prepare("INSERT INTO " +getTableName()+
                      "( permiss, "
                      "name, "
                      "passwd )"
                      "VALUES(:permiss, "
                      ":name, "
                      ":passwd )");

        query.bindValue(":permiss",     pRec->permiss );
        query.bindValue(":name",    pRec->name );
        query.bindValue(":passwd",   pRec->passwd);

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

bool NameData::updateRec(void *Rec)
{
    RecName *pRec = (RecName*)Rec;
    QSqlQuery query;

    QString cmd =  QString("UPDATE " + getTableName() + " set permiss='%1', "
                                                        " passwd='%2' "
                           + " WHERE name='%3' ")
            .arg( pRec->permiss)
            .arg( pRec->passwd)
            .arg( pRec->name);

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

bool NameData::delRec(void *Rec)
{
    RecName *pRec = (RecName*)Rec;
    QSqlQuery query;
    qDebug()<< "delRec1";
    QString strCmd = QString("DELETE from "+ getTableName() +" where name='%1' ")
            .arg( pRec->name);

    query.prepare( strCmd );
    qDebug()<< "delRec2";
    query.exec();

    qDebug() << query.lastError();
    return !(query.lastError().isValid());
}

bool NameData::delRec(QDateTime dt1, QDateTime dt2)
{
    return true;
}

QLinkedList<RecName>* NameData::queryRec(QString name)
{
    QLinkedList<RecName> * ret = new QLinkedList< RecName >;
    QSqlQuery query;

    if( !name.isEmpty())
    {
        query.exec( QString("SELECT * from " + getTableName() + " where name='%1' ")
                    .arg( name ) );
    }
    else
        query.exec( QString("SELECT * from " + getTableName() ));

    while (query.next())
    {
        int cnt = 0;
        RecName Rec;

        Rec.permiss = query.value(cnt++).toString();
        Rec.name = query.value(cnt++).toString();
        Rec.passwd = query.value(cnt++).toString();
        *ret << Rec;
    }

    return ret;
}

bool NameData::findDuplicateRec(const RecName &Rec)
{
    bool ret = false;
    QLinkedList< RecName > *recList = queryRec( Rec.name);

    if (recList->count() > 0)
        ret = true;

    delete recList;
    recList = 0;

    return ret;
}
