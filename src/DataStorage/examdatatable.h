#ifndef EXAMDATATABLE_H
#define EXAMDATATABLE_H

#include <QLinkedList>
#include "dbtable.h"
#include <QDateTime>

struct RecExam
{
    QString name;       //姓名
    QString gender;     //性别
    QString ID;         //身份证号码
    QString donorCode;  //供浆员编号
    QString addr;       //地址

    QString isPrint;     //已打印  Y/N
    QString isUploaded;  //已上传  Y/N

    qreal weight;      //体重
    quint32 age;         //年龄
    qreal temperature; //体温
    quint32 pulse;       //脉搏
    quint32 hBldPrs;     //收缩压
    quint32 lBldPrs;     //舒张压
    QDateTime time;      //体检时间

    RecExam()
    {
        this->name         = "";
        this->gender       = "";
        this->ID           = "";        
        this->donorCode    = "";
        this->addr         = "";

        this->isPrint      = "";
        this->isUploaded   = "";

        this->weight       = 0;
        this->age          = 0;
        this->temperature  = 0;
        this->pulse        = 0;
        this->hBldPrs      = 0;
        this->lBldPrs      = 0;
        //this->time         = 0;
    }

    RecExam operator &=( const  RecExam& rec )
    {
        this->name         = rec.name;
        this->gender       = rec.gender;
        this->ID           = rec.ID;
        this->donorCode    = rec.donorCode;
        this->addr         = rec.addr;

        this->isPrint      = rec.isPrint;
        this->isUploaded   = rec.isUploaded;

        this->weight       = rec.weight;
        this->age          = rec.age;
        this->temperature  = rec.temperature;
        this->pulse        = rec.pulse;
        this->hBldPrs      = rec.hBldPrs;
        this->lBldPrs      = rec.lBldPrs;
        this->time         = rec.time;

        return *this;
    }
};

class ExamDataTable:public DBTable
{
    Q_OBJECT

public:
    explicit ExamDataTable( QString strName );

    bool create();
    bool addRec( const  RecExam& rec );
    bool updateRec( const  RecExam& rec );
    bool delRec( const  RecExam& rec );
    bool delRec( QDateTime dt1, QDateTime dt2 );
    QLinkedList< RecExam > * queryRec( QString donorCode, QString id );
    QLinkedList< RecExam > * queryRec( QDateTime dt1, QDateTime dt2 );

private:
    bool findDuplicateRec( const  RecExam& rec );
    bool isUploadedRec( const  RecExam& rec );
};

#endif // EXAMDATATABLE_H
