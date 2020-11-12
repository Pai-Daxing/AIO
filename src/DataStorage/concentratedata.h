#ifndef CONCENTRATEDATA_H
#define CONCENTRATEDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecConcentrate {
    QString proName;        //项目名称
    QString conTime;        //浓缩离心时间
    QString conForce;       //浓缩离心力
    QString conVolume;      //浓缩保留容积
    QString conStartTime;   //浓缩离心开始时间
    QString conEndTime;     //浓缩离心结束时间

    RecConcentrate()
    {
        this->proName = "";
        this->conTime = "";
        this->conForce = "";
        this->conVolume = "";
        this->conStartTime = "";
        this->conEndTime = "";
    }

    RecConcentrate operator &=(const RecConcentrate& Rec)
    {
        this->proName = Rec.proName;
        this->conTime = Rec.conTime;
        this->conForce = Rec.conForce;
        this->conVolume = Rec.conVolume;
        this->conStartTime = Rec.conStartTime;
        this->conEndTime = Rec.conEndTime;

        return *this;
    }
};

class ConcentrateData : public DBTable
{
    Q_OBJECT
public:
    explicit ConcentrateData(QString strName);

    bool create();
    bool addRec(void* Rec);
    bool updateRec(void* Rec);
    bool delRec(void* Rec);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< RecConcentrate >* queryRec(QString proName);

private:
    bool findDuplicateRec(const RecConcentrate& Rec);
};

#endif // CONCENTRATEDATA_H
