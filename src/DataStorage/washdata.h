#ifndef WASHDATA_H
#define WASHDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecWash {
    QString proName;        //项目名称
    QString washLiqVolume;      //洗涤液容积
    QString washNum;            //洗涤次数
    QString washTime;           //洗涤离心时间
    QString washForce;          //洗涤离心力
    QString washVolume;         //洗涤保留容积
    QString washStartTime;          //洗涤离心力
    QString washEndTime;         //洗涤保留容积

    RecWash()
    {
        this->proName = "";
        this->washLiqVolume = "";
        this->washNum = "";
        this->washTime = "";
        this->washForce = "";
        this->washVolume = "";
        this->washStartTime = "";
        this->washEndTime = "";
    }

    RecWash operator &=(const RecWash& Rec)
    {
        this->proName = Rec.proName;
        this->washLiqVolume = Rec.washLiqVolume;
        this->washNum = Rec.washNum;
        this->washTime = Rec.washTime;
        this->washForce = Rec.washForce;
        this->washVolume = Rec.washVolume;
        this->washStartTime = Rec.washStartTime;
        this->washEndTime = Rec.washEndTime;

        return *this;
    }
};

class WashData : public DBTable
{
    Q_OBJECT
public:
    explicit WashData(QString strName);

    bool create();
    bool addRec(void* Rec);
    bool updateRec(void* Rec);
    bool delRec(void* Rec);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< RecWash >* queryRec(QString proName);

private:
    bool findDuplicateRec(const RecWash& Rec);
};

#endif // WASHDATA_H
