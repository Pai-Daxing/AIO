#ifndef SERIALAPP_H
#define SERIALAPP_H

#include <QObject>
#include "../Protocol/commands.h"

//#define VIRTUALCOM

class QSerialPort;
class COMProtocol;

typedef enum
{
    cmdAck_OK = 0,
    cmdAck_InvalidLen,
    cmdAck_IncorrectCRC,
    cmdAck_UnexpectedEnd,
    cmdAck_ReceiveBufferFull,
    cmdAck_TimeOut,
    cmdAck_Reject,
    cmdAck_NULL = 0xFF
}cmdAckType;

#define FRAME_TYPE_SECURED         (1)
#define FRAME_TYPE_SECURED_ACK     (2)
#define FRAME_TYPE_NONE_SECURED    (3)

struct stCmd{
    quint16 cmd;
    short   params[128];
    quint32 num;
};

#define BUF_LEN  (128)

#define DATA_LINK_FRAME_LEN  (128)

typedef struct
{
    quint8 type;
    quint8 loop;
    quint8 len;
    quint8 payload[DATA_LINK_FRAME_LEN];
    quint8 crc;
}TDataLinkFrame;

class SerialApp: public QObject
{
    Q_OBJECT

    friend class ExamProtocol;
public:
    virtual ~SerialApp();
    static SerialApp& getInstance(){static SerialApp a(0); return a;}

    bool init(const QString name, qint32 baudRate=115200);
    bool openCOM(const QString name, qint32 baudRate=115200);
    void closeCOM();

    explicit SerialApp( QObject *parent );


    bool send(CommandID cmd, const CmdParam *params=0, quint32 num=0);

    quint8 getVersion(int index);

//protected:
//    void run();

//    QThread workerThread;
//    quint8 getVersion(int index);



protected:
    void timerEvent(QTimerEvent *event);

public slots:
    void onUICmd(quint16 cmd, const CmdParam *params=0, quint32 num=0);
    bool hwSend(const quint8* buf, quint32 len);
private slots:
    void onReadyRead();
    void parseData(const quint8* data, int len);
signals:
    void setErrNo(qint16 errNo);
    void setAlarmType(qint16 newType);
    void setReadcode(qint16 Readcode);
    void setCtrlSysStatus(qint16 newStatus);
    void setIO1Param(qint32 IO1);
    void setIO2Param(qint32 IO2);

    void COMdata(const quint8* , int);
    void COMStr(QString);
private:
//    explicit SerialApp( QObject *parent );

    QSerialPort *m_pSerial;
    COMProtocol *m_pComProtocol;
    int m_DebugTiemrId;
    int m_cmdTimerId;

    QList<stCmd*> m_cmdList;
};

class COMProtocol:public QObject
{
    Q_OBJECT

    typedef enum _RX_STATE{
        _sWaitBegin,
        _sWaitType,
        _sWaitLoop,
        _sWaitLength,
        _sWaitData,
        _sWaitCheck,
        _sWaitEnd
    } RX_STATE;

    typedef struct{
        quint8 loop;
        quint32 time;
        bool bvalid;
    } FrameNode;

public:
    COMProtocol();
    qint32 parseCOMData(quint8 *chbuf, int len);

    bool isCmdFinished( quint8* ack);
    qint32 Protocol_Send(const quint8 * buf, quint8 len);
    qint32 Protocol_Send_Secure(const quint8 * buf, quint8 len, qint32 timeout);
protected:
    qint32 SendSecuredFrameAck(quint8 loop, quint8 ack);
    void timerEvent(QTimerEvent *event);
signals:
    void COMdata(const quint8* , int);
    void sendFromProtocol(const quint8* , quint8);
private:
    RX_STATE m_smRxState;
    quint8   m_usDataCnt;
    quint8   m_usRxWord;
    quint8   m_usChkSum;
    bool m_sbUnicodeData;
    TDataLinkFrame m_buf;
    QList<FrameNode*> m_bufTx;
    QList<TDataLinkFrame*> m_bufRecv;

    quint8   m_AckRslt;
};

#endif // SERIALAPP_H
