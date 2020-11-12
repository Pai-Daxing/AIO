#ifndef PARAMMGR_H
#define PARAMMGR_H

#include <QObject>
#include <QFile>
#include <QIntValidator>
#include "../DataStorage/datastorage.h"
#include "../Protocol/commands.h"

class NIntValidator : public QIntValidator
{
    Q_OBJECT
public:
    explicit NIntValidator(QObject *parent = 0);
    NIntValidator(int min, int max, QObject *parent = 0);
    void fixup(QString &input) const;
    QValidator::State validate ( QString & input, int & pos ) const;
};

struct RecRTParam
{
    quint16 productscale;
    quint16 samplescale;
    QString DPM;
    quint16 redcells;
    QString Dpump_DPM;
    quint16 color_red;
    quint16 color_blue;
    quint16 color_green;
    quint16 ppump_speed;    //蠕动泵速度
    quint16 CentrifugalForce;       //离心机实时转速
    quint16 SelfTestError;
};

typedef union {
    struct {
        unsigned RamPump_backzero:  1;   //柱塞泵——回零
        unsigned RamPump_TIP: 1;         //柱塞泵——TIP
        unsigned Putwastebox: 1;         //是否放废料盒
        unsigned Closewastebox: 1;       //是否关废料盒
        unsigned Ch1_putragent: 1;       //通道1是否放试剂条
        unsigned Ch2_putragent: 1;       //通道2是否放试剂条
        unsigned Ch3_putragent: 1;       //通道3是否放试剂条
        unsigned Ch4_putragent: 1;       //通道4是否放试剂条
        unsigned Ch1_closeragent: 1;     //通道1是否关试剂条盖
        unsigned Ch2_closeragent: 1;     //通道2是否关试剂条盖
        unsigned Ch3_closeragent: 1;     //通道3是否关试剂条盖
        unsigned Ch4_closeragent: 1;     //通道4是否关试剂条盖
        unsigned Door_close: 1;          //是否关舱门
    };
    struct {
        unsigned w:32;
    };
} IOParam_t;

typedef union {
    struct {
        unsigned Ch1_Sample: 1;       //通道1是否放样本
        unsigned Ch2_Sample: 1;       //通道2是否放样本
        unsigned Ch3_Sample: 1;       //通道3是否放样本
        unsigned Ch4_Sample: 1;       //通道4是否放样本
    };
    struct {
        unsigned w:32;
    };
} SampleParam_t;

class ParamMgr : public QObject
{
    Q_OBJECT

public:
    virtual ~ParamMgr();
    void   init(QObject* sender);
    /*获取参数管理器*/
    static ParamMgr* getInstance();

signals:
    void COMdata(QString str); // 串口数据
    void signalRamPumpBackzero(qint16 newValue);
    void signalRamPumpTIP(qint16 newValue);
    void signalPutWasteBox(qint16 newValue);
    void signalCloseWasteBox(qint16 newValue);
    void signalCh1PutRagent(qint16 newValue);
    void signalCh2PutRagent(qint16 newValue);
    void signalCh3PutRagent(qint16 newValue);
    void signalCh4PutRagent(qint16 newValue);
    void signalCh1CloseRagent(qint16 newValue);
    void signalCh2CloseRagent(qint16 newValue);
    void signalCh3CloseRagent(qint16 newValue);
    void signalCh4CloseRagent(qint16 newValue);
    void signalDoorClose(qint16 newValue);

    void signalCh1Sample(qint16 newValue);
    void signalCh2Sample(qint16 newValue);
    void signalCh3Sample(qint16 newValue);
    void signalCh4Sample(qint16 newValue);
    //以上信号由调用“当次采集参数设置”接口的线程发射

public slots:
    void onComData(QString str);             //
    void onSetIO1Param(qint32 newValue);
    void onSetIO2Param(qint32 newValue);



protected:

private:
    explicit ParamMgr(QObject *parent = 0);

    qint16 m_nTimerId;

    IOParam_t m_IOVar;
    SampleParam_t m_SampleVar;
    bool   m_bSendChange;
    RecRTParam *m_pRecRt;
};

#endif // PARAMMGR_H
