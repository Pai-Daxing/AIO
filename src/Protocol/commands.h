#ifndef COMMANDS_H
#define COMMANDS_H


enum DataType
{
    DT_STATU,     //状态数据
    DT_PARAM,      //参数数据
};

typedef enum _CommandID {
    CMD_shake_hand,      //握手

    CMD_SelfTest,           //开机自检
    CMD_TipTest,            //开始tip头检测
    CMD_ChStartRun,        //通道开始运行
    CMD_ChSearchOK,         //所有通道上位机搜索完成
    CMD_AxisStart,            //三轴运行 x轴：1 y轴：2 z轴：3
    CMD_AxisStop,            //三轴停止
    CMD_AxisInit,           //三轴初始化
    /********柱塞泵*********/
    CMD_debug_ramPumpinit,                 //柱塞泵初始化(复位)
    CMD_debug_ramPumpstart,                 //柱塞泵启
    CMD_debug_ramPumpstop,                 //柱塞泵停

    CMD_Motorcontinue,                     //电机过载后继续运动
} CommandID;

typedef struct{
    short Param_one = 0;
    short Param_two= 0;
    short Param_three= 0;
    short Param_four= 0;
    short Param_five= 0;
    short Param_six= 0;
    short Param_seven= 0;
} CmdParam;     //“设置...”命令参数类型

#endif // COMMANDS_H
