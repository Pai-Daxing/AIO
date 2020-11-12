#ifndef TECHNOLOGYDATA_H
#define TECHNOLOGYDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecTech
{
    QString techname;      //工艺名称
    QString steps;    //步骤
    QString fetchhole;  //取物孔
    QString rhole;     //置物孔
    QString mwv;        //移液量
    QString mixnum;     //混合次数
    QString tip;        //是否更换tip头
    RecTech()
    {
        this->techname   = "";
        this->steps   = "";
        this->fetchhole ="";
        this->rhole   = "";
        this->mwv = "";
        this->mixnum = "";
        this->tip = "";
    }

    RecTech operator &=(const RecTech& rec)
    {
        this->techname     = rec.techname;
        this->steps   = rec.steps;
        this->fetchhole = rec.fetchhole;
        this->rhole    = rec.rhole;
        this->mwv       = rec.mwv;
        this->mixnum = rec.mixnum;
        this->tip = rec.tip;

        return *this;
    }
};

class Technologydata:public DBTable
{
    Q_OBJECT

public:
    explicit Technologydata( QString strName );

    bool create();
    bool addRec(void* rec);
    bool updateRec(void* rec);
    bool delRec(void* rec);

    QLinkedList< RecTech>* queryRec(QString steps, QString techname);
private:
    bool findDuplicateRec(const RecTech& rec);
};

#endif // TECHNOLOGYDATA_H
