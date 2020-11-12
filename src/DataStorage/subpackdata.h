#ifndef SUBPACKDATA_H
#define SUBPACKDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecPack{
    QString proName;        //项目名称
    QString OnePack;        //一号袋子容积
    QString TwoPack;       //二号袋子容积
    QString ThreePack;      //三号袋子容积
    QString FourPack;       //四号袋子容积

    RecPack()
    {
        this->proName = "";
        this->OnePack = "";
        this->TwoPack = "";
        this->ThreePack = "";
        this->FourPack = "";
    }

    RecPack operator &=(const RecPack& Rec)
    {
        this->proName = Rec.proName;
        this->OnePack = Rec.OnePack;
        this->TwoPack = Rec.TwoPack;
        this->ThreePack = Rec.ThreePack;
        this->FourPack = Rec.FourPack;

        return *this;
    }
};

class SubpackData : public DBTable
{
    Q_OBJECT
public:
    explicit SubpackData(QString strName);

    bool create();
    bool addRec(void* Rec);
    bool updateRec(void* Rec);
    bool delRec(void* Rec);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< RecPack >* queryRec(QString proName);

private:
    bool findDuplicateRec(const RecPack& Rec);
};

#endif // SUBPACKDATA_H
