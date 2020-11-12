#ifndef DATASTORAGE_H
#define DATASTORAGE_H

#include <QObject>
#include <QThread>
#include <QDateTime>
#include <QLinkedList>

#include "namedata.h"
#include "logdata.h"
#include "technologydata.h"

enum TABLETYPE
{
    NAME_TB,
    LOG_TB,
    TECH_TB,
    MAX_TB
};

class DataStorage :public QObject
{
    Q_OBJECT

public:
    explicit DataStorage(QObject *parent = 0);
    ~DataStorage();

    static DataStorage& getInstance(){static DataStorage ds; return ds;}

    QString getTableName( TABLETYPE type );

    bool updateRec( void* rec, TABLETYPE type=NAME_TB );
    bool saveRec( void* rec, TABLETYPE type=NAME_TB );
    bool delRst( void* rst, TABLETYPE type=NAME_TB);

    void *getData( TABLETYPE type, QDateTime dt1, QDateTime dt2 );
    void *getData( TABLETYPE type, QString strVal, QString strVal1 );

    bool init();
signals:

public slots:

private:
    bool initDbTable();   //初始化数据库表格
    DBTable *getTbPointer(TABLETYPE type);
private:

     NameData *m_pName;
     LogTable       *m_pLogTb;
     Technologydata *m_pTechTb;
};

#endif // DATASTORAGE_H
