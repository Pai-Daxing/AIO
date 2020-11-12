#ifndef ALARMS_H
#define ALARMS_H

typedef enum _AlarmType
{
    ALM_none = 0x00,          //无报警
    ALM_ComError,             //串口通信异常
    ALM_SelfZcanfail,         //Z轴失败
    ALM_SelfYcanfail,         //Y轴失败
    ALM_SelfXcanfail,         //X轴失败
    ALM_SelfRampumpfail,      //柱塞泵失败
    ALM_PutWBOXfail,         //废料盒未安装
    ALM_CloseWBOXfail,      //废料盒未关闭
    EC_TEMP1_F,          //temp1错误
    EC_TEMP2_F,          //temp2错误
    EC_TEMP3_F,          //temp3错误
    EC_TEMP4_F,          //temp4错误
    EC_TEMP5_F,        //temp5错误
    EC_TEMP6_F,          //temp6错误
    EC_TEMP7_F,         //temp7错误
    EC_TEMP8_F,          //temp8错误
    EC_TEMP9_F,          //temp9错误
    EC_TEMP10_F,         //temp10错误
    EC_TEMP11_F,         //temp11错误
    EC_TEMP12_F,         //temp12错误

    AlmType_MAX,
} AlarmType;


//错误代码
typedef enum _ErrorCode
{
    EC_NONE = 0,
//    EC_TEMP1_F,          //temp1错误
//    EC_TEMP2_F,          //temp2错误
//    EC_TEMP3_F,          //temp3错误
//    EC_TEMP4_F,          //temp4错误
//    EC_TEMP5_F,        //temp5错误
//    EC_TEMP6_F,          //temp6错误
//    EC_TEMP7_F,         //temp7错误
//    EC_TEMP8_F,          //temp8错误
//    EC_TEMP9_F,          //temp9错误
//    EC_TEMP10_F,         //temp10错误
//    EC_TEMP11_F,         //temp11错误
//    EC_TEMP12_F,         //temp12错误
   EC_MAX
} ErrorCode;

#endif // ALARMS_H
