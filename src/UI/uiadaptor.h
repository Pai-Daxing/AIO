#ifndef UIADAPTOR_H
#define UIADAPTOR_H

#include <QObject>
#include <QQuickItem>
#include <QProcess>
#include <QSettings>
#include "../Protocol/commands.h"
#include "../AlarmMgr/alarmmgr.h"
class UiAdaptor : public QObject
{
    Q_OBJECT
public:
    explicit UiAdaptor(QObject *parent = nullptr);
    Q_INVOKABLE void startTipTest();
    Q_INVOKABLE void chStartRun(QString ch, QString num, QString tech);
    Q_INVOKABLE void chSearchSuccess();
    Q_INVOKABLE void axisToStart(QVariantList axis);
    Q_INVOKABLE void axisToInit(QVariantList axisin);
    Q_INVOKABLE void axisToStop(QVariantList axisst);
    Q_INVOKABLE void zsbToStart(QVariantList zsb);
    Q_INVOKABLE void zsbToStop();
    Q_INVOKABLE void zsbToInit();
    Q_INVOKABLE void selfInspection();
     Q_INVOKABLE void okChStartRun();




    Q_INVOKABLE void saveTech(QVariantList tech);
    Q_INVOKABLE void delTech(QString value);
    Q_INVOKABLE void saveNameParam(QVariantList nameParma);
    Q_INVOKABLE void delNameParam(QString name);
    Q_INVOKABLE void loginCRC(QVariantList name);
    Q_INVOKABLE void findUserName(void);
    Q_INVOKABLE QVariantList selectAllTech(void);
    Q_INVOKABLE void delTechOne(QString name);

    Q_INVOKABLE void savePdf(QVariantList pdfParam);
    Q_INVOKABLE void copyPdf(QString name);
    Q_INVOKABLE void delPdf(QString name);
    Q_INVOKABLE void copyToUSB();
    Q_INVOKABLE void clearDataPdf();
    Q_INVOKABLE void changeOperatorPWD(QVariantList cpwd);
    Q_INVOKABLE void updateReadme();
    Q_INVOKABLE void updateSoft();
    Q_INVOKABLE void saveAlarm(QVariantList alarm);
signals:
    void UICmd(quint16 cmd, const CmdParam *params, unsigned char num);
    void setCSS2StandBy();
    void setCSSCh1Step1Success();
    void setCSSCh1Step2Success();
    void setCSSCh1Step3Success();
    void setCSSCh1Step4Success();
    void setCSSCh1Step5Success();
    void setCSSCh1Step6Success();
    void setCSSCh1Step7Success();
    void setCSSCh1Step8Success();
    void setCSSCh1Step9Success();
    void setCSSCh1Step10Success();
    void setCSSCh2Step1Success();
    void setCSSCh2Step2Success();
    void setCSSCh2Step3Success();
    void setCSSCh2Step4Success();
    void setCSSCh2Step5Success();
    void setCSSCh2Step6Success();
    void setCSSCh2Step7Success();
    void setCSSCh2Step8Success();
    void setCSSCh2Step9Success();
    void setCSSCh2Step10Success();
    void setCSSCh3Step1Success();
    void setCSSCh3Step2Success();
    void setCSSCh3Step3Success();
    void setCSSCh3Step4Success();
    void setCSSCh3Step5Success();
    void setCSSCh3Step6Success();
    void setCSSCh3Step7Success();
    void setCSSCh3Step8Success();
    void setCSSCh3Step9Success();
    void setCSSCh3Step10Success();
    void setCSSCh4Step1Success();
    void setCSSCh4Step2Success();
    void setCSSCh4Step3Success();
    void setCSSCh4Step4Success();
    void setCSSCh4Step5Success();
    void setCSSCh4Step6Success();
    void setCSSCh4Step7Success();
    void setCSSCh4Step8Success();
    void setCSSCh4Step9Success();
    void setCSSCh4Step10Success();
    void setCSSSelfTest();
    void setCSSTipTestSuccess();
    void setCSSCoverClose();
    void setCSSSelftestOver();
    void setCSSAddTip();
    void setCSSSelfcover();
    void setCSSSelfZcan();
    void setCSSSelfYcan();
    void setCSSSelfXcan();

    //io量
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

    void udiskRemove();
    void udiskAdd();
    void allTechName(QList<QString> list);
    void userNameSignal(QList<QString>  list);
    void loginSucceed(QList<QString> namelist);
    void loginFailed();
    void cpwdError();
    void cpwdSucceed();
    void noReadme();
    void updateReadmeSignal(QString txt);
    void curVersionNew();
    void usbIsNull();
    void cacheIsNull();
    void copySuccee();

    void raiseAlarm(qint16 lv, QString str, QString details);
    void cancelAlarm();

public slots:
    void onCtrlSysStatusChanged(qint16 newStatus);
    void onAlarmStart(AlarmInfo alarm);
    void onCancelAlarm(AlarmInfo alarm);
private:
    void pdfDrawForm(QPainter* paint,int y,int horzBorder,int row,int column,int unitHeight,QFont &font,QStringList& list);

    QProcess   *m_pExecProc;

    QString CurVerison = "V0.0.1";    //定义当前软件的版本号

};

#endif // UIADAPTOR_H
