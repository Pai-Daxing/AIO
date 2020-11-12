#ifndef CFG_H
#define CFG_H

#include <QObject>
#include <QSettings>

#define CFG_TYPE_TRUE   ("1")
#define CFG_TYPE_FALSE  ("0")

#define PLASMA_SET_FILE  ("./Datas/cfg.ini")

enum CFG_BOOL
{
    CFG_NO,
    CFG_YES
};

enum CFGSETTING
{
     CFG_HoleMask           //孔位屏蔽
    ,CFG_Names              //操作者名列表
    ,CFG_CurOptName         //操作者
    ,CFG_CurChkName         //审批人
    ,CFG_Days               //保存时间列表
    ,CFG_LastPatch          //最后一次批号
    ,CFG_Prefix             //版编号前缀     板编号形式（前缀+日期+序号）
    ,CFG_COM                //打印机串口
    ,CFG_BRate              //串口波特率
    ,CFG_BarC_X             //条码起始位置
    ,CFG_BarC_Y             //条码起始位置
    ,CFG_BarC_H             //条码高度
    ,CFG_BarC_W             //条码宽度
    ,CFG_BarC_Type          //条码类型
    ,CFG_COM_WIN32
    ,CFG_COM_LINUX

    ,NW_wlan             //是否设置为无线连接
    ,NW_hostIp           //主机的ip
    ,NW_gatewayAdress    //网关
    ,NW_netmask          //子网掩码
    ,NW_key              //密钥
    ,NW_ServerAdress     //服务器地址
    ,CFG_dataMgrSys      //数据管理系统
};

enum SrvName
{
     LANGCHENG            //朗程信息系统
};

enum enumDevExist
{
    CFG_FALSE,        //有外设
    CFG_TRUE        //无外设
};
class Cfg : public QObject
{
    Q_OBJECT
    public:

    static Cfg& getInst();
    //获取指定字符型配置项的用户设置值（如果指定的配置项不存在，返回空）
    QString  getUsrCfgStr(CFGSETTING id);

    //设置指定字符型配置项的用户设置值（如果指定的配置项不存在，返回false）
    void setUsrCfgStr(CFGSETTING id, QString value);

    void setServerName( SrvName index );
    SrvName  getServerName( );
private:
    Cfg( QObject *parent = 0 );

signals:
    
public slots:

private:
    QSettings *m_pCfgSetting;
    QHash< int, QString > m_Hash;
};

#endif // CFG_H
