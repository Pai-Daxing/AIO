#ifndef LOGDATA_H
#define LOGDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecLog
{
    QString username;      //用户
    QString project;    //实验项目
    QDateTime starttime;  //开始时间
    QString alarmstr;     //报警信息

    RecLog()
    {
        this->username   = "";
        this->project   = "";
        this->starttime ;
        this->alarmstr   = "";
    }

    RecLog operator &=(const RecLog& rec)
    {
        this->username     = rec.username;
        this->project   = rec.project;
        this->starttime = rec.starttime;
        this->alarmstr    = rec.alarmstr;
        return *this;
    }
};

class LogTable:public DBTable
{
    Q_OBJECT

public:
    explicit LogTable( QString strName );

    bool create();
    bool addRec(void* rec);
    bool updateRec(void* rec);
    bool delRec(void* rec);

    bool delRec( QDateTime dt1, QDateTime dt2 );
    QLinkedList< RecLog >* queryRec(QString project);
private:
    int getOrder();
};

#endif // LOGDATA_H
