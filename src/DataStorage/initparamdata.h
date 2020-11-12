#ifndef INITPARAMDATA_H
#define INITPARAMDATA_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct InitParam{
    QString proName;        //项目名称
    QString sampCode;       //样品编码
    QString sampVolume;     //样品容积
    QString manualcollect;  //是否手动收集
    QString backWash;       //是否回冲

    InitParam()
    {
        this->proName = "";
        this->sampCode = "";
        this->sampVolume = "";
        this->manualcollect = "";
        this->backWash = "";
    }

    InitParam operator &=(const InitParam& Init)
    {
        this->proName = Init.proName;
        this->sampCode = Init.sampCode;
        this->sampVolume = Init.sampVolume;
        this->manualcollect = Init.manualcollect;
        this->backWash = Init.backWash;

        return *this;
    }
};

class InitParamData:public DBTable
{
    Q_OBJECT
public:
    explicit InitParamData( QString strName);

    bool create();
    bool addRec(void* Init);
    bool updateRec(void* Init);
    bool delRec(void* Init);

    bool delRec( QDateTime dt1, QDateTime dt2);
    QLinkedList< InitParam >* queryRec(QString proName);

private:
    bool findDuplicateRec(const InitParam& Init);
};

#endif // INITPARAMDATA_H
