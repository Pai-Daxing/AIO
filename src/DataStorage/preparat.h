#ifndef PREPARAT_H
#define PREPARAT_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecPre{
    QString proName;        //项目名称
    QString PreparatVolume;        //制剂袋容积
    QString SamCellNum;       //样本细胞计数
    QString DilutRatio;      //稀释比

    RecPre()
    {
        this->proName = "";
        this->PreparatVolume = "";
        this->SamCellNum = "";
        this->DilutRatio = "";
    }

    RecPre operator &=(const RecPre& Rec)
    {
        this->proName = Rec.proName;
        this->PreparatVolume = Rec.PreparatVolume;
        this->SamCellNum = Rec.SamCellNum;
        this->DilutRatio = Rec.DilutRatio;

        return *this;
    }
};

class Preparat : public DBTable
{
    Q_OBJECT
public:
    explicit Preparat(QString strName);

    bool create();
    bool addRec(void* Rec);
    bool updateRec(void* Rec);
    bool delRec(void* Rec);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< RecPre >* queryRec(QString proName);

private:
    bool findDuplicateRec(const RecPre& Rec);
};

#endif // PREPARAT_H
