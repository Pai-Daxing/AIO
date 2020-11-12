/***********************************************************************
* dlgpswsetting.cpp
* Copyright all resever(2013)
*
* 因为报警字符串不能即时翻译成多语言，所以用UI类来建，通过QEvent::LanguageChange来
* 刷新多语言字符
*
* Author              Date               Action
* lilice              2013/7/10           create
*
***********************************************************************/
#include "alarmstr.h"

AlarmString::AlarmString(QObject *parent) :
    QObject(parent)
{
    //    ui.setupUi(this);

    resetStr();
}

void AlarmString::resetStr()
{
    ALARMSTRING str[AlmType_MAX] =
    {
        { ALM_none,                 "", "" },

        {
            ALM_ComError,
            tr("控制系统通信异常"),
            tr("系统遇到了无法恢复的报警情况.\n"
            "请立即断开电源,联系用服.\n"
            "使用重力回输法进行回输.")
        },
        {ALM_SelfZcanfail,    tr("Z轴异常"),  tr("Details")},
        {ALM_SelfYcanfail,    tr("Y轴异常"),  tr("Details")},
        {ALM_SelfXcanfail,    tr("X轴异常"),  tr("Details")},
        {ALM_SelfRampumpfail, tr("柱塞泵异常"),  tr("Details")},
        {ALM_PutWBOXfail,     tr("废料盒未安装"),  tr("Details")},
        {ALM_CloseWBOXfail,   tr("废料盒未关闭"),  tr("Details")},

        { EC_TEMP1_F  , tr("1号温度传感器异常"), tr("Details")},
        { EC_TEMP2_F  , tr("2号温度传感器异常"), tr("Details")},
        { EC_TEMP3_F  , tr("3号温度传感器异常"), tr("Details")},
        { EC_TEMP4_F  , tr("4号温度传感器异常"), tr("Details")},
        { EC_TEMP5_F  , tr("5号温度传感器异常"), tr("Details")},
        { EC_TEMP6_F  , tr("6号温度传感器异常"), tr("Details")},
        { EC_TEMP7_F  , tr("7号温度传感器异常"), tr("Details")},
        { EC_TEMP8_F  , tr("8号温度传感器异常"), tr("Details")},
        { EC_TEMP9_F  , tr("9号温度传感器异常"), tr("Details")},
        { EC_TEMP10_F  , tr("10号温度传感器异常"), tr("Details")},
        { EC_TEMP11_F  , tr("11号温度传感器异常"), tr("Details")},
        { EC_TEMP12_F  , tr("12号温度传感器异常"), tr("Details")},
    };

    for ( int i = 0; i < AlmType_MAX; i++  )
    {
        m_str[i].type = str[i].type;
        m_str[i].str   = str[i].str;
        m_str[i].details = str[i].details;
    }
}

//void AlarmString::changeEvent(QEvent *e)
//{
//    QWidget::changeEvent(e);
//    switch (e->type()) {
//    case QEvent::LanguageChange:
//        ui.retranslateUi(this);

//        resetStr();
//        break;
//    default:
//        break;
//    }
//}
