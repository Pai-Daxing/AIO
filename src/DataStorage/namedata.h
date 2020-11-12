#ifndef NAMEDATA_H
#define NAMEDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecName {
    QString permiss;        //用户权限
    QString name;           //姓名
    QString passwd;         //密码

    RecName()
    {
        this->permiss = "";
        this->name = "";
        this->passwd = "";
    }

    RecName operator &=(const RecName& Rec)
    {
        this->permiss = Rec.permiss;
        this->name = Rec.name;
        this->passwd = Rec.passwd;

        return *this;
    }
};

class NameData : public DBTable
{
    Q_OBJECT
public:
    explicit NameData(QString strName);

    bool create();
    bool addRec(void* Rec);
    bool updateRec(void* Rec);
    bool delRec(void* Rec);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< RecName >* queryRec(QString name);

private:
    bool findDuplicateRec(const RecName& Rec);
};

#endif // NAMEDATA_H
