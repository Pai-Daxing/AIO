#ifndef DBTABLE_H
#define DBTABLE_H

#include <QObject>
#include <QDateTime>
#include <QtSql>

class DBTable:public QObject
{
     Q_OBJECT

public:
    DBTable(QString strName);
    virtual ~DBTable();

    QString getTableName();

    virtual bool create() = 0;
    virtual bool addRec(void* rec ) = 0;
    virtual bool updateRec(void* rec) = 0;
    virtual bool delRec(void* rec) = 0;
private:
    QString m_tblName;
};

#endif // DBTABLE_H
