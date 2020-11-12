#ifndef STATUSDEFINE_H
#define STATUSDEFINE_H

enum ControlSystemStatus //控制系统状态值定义
{
    CSS_unknown = 0,                  //未知
    CSS_standby,                      //待机
    CSS_Ch1Step1Success,    //通道1第1步完成
    CSS_Ch1Step2Success,    //通道1第2步完成
    CSS_Ch1Step3Success,    //通道1第3步完成
    CSS_Ch1Step4Success,    //通道1第4步完成
    CSS_Ch1Step5Success,    //通道1第5步完成
    CSS_Ch1Step6Success,    //通道1第6步完成
    CSS_Ch1Step7Success,    //通道1第7步完成
    CSS_Ch1Step8Success,    //通道1第8步完成
    CSS_Ch1Step9Success,    //通道1第9步完成
    CSS_Ch1Step10Success,    //通道1第10步完成
    CSS_Ch2Step1Success,    //通道2第1步完成
    CSS_Ch2Step2Success,    //通道2第2步完成
    CSS_Ch2Step3Success,    //通道2第3步完成
    CSS_Ch2Step4Success,    //通道2第4步完成
    CSS_Ch2Step5Success,    //通道2第5步完成
    CSS_Ch2Step6Success,    //通道2第6步完成
    CSS_Ch2Step7Success,    //通道2第7步完成
    CSS_Ch2Step8Success,    //通道2第8步完成
    CSS_Ch2Step9Success,    //通道2第9步完成
    CSS_Ch2Step10Success,    //通道2第10步完成
    CSS_Ch3Step1Success,    //通道3第1步完成
    CSS_Ch3Step2Success,    //通道3第2步完成
    CSS_Ch3Step3Success,    //通道3第3步完成
    CSS_Ch3Step4Success,    //通道3第4步完成
    CSS_Ch3Step5Success,    //通道3第5步完成
    CSS_Ch3Step6Success,    //通道3第6步完成
    CSS_Ch3Step7Success,    //通道3第7步完成
    CSS_Ch3Step8Success,    //通道3第8步完成
    CSS_Ch3Step9Success,    //通道3第9步完成
    CSS_Ch3Step10Success,    //通道3第10步完成
    CSS_Ch4Step1Success,    //通道4第1步完成
    CSS_Ch4Step2Success,    //通道4第2步完成
    CSS_Ch4Step3Success,    //通道4第3步完成
    CSS_Ch4Step4Success,    //通道4第4步完成
    CSS_Ch4Step5Success,    //通道4第5步完成
    CSS_Ch4Step6Success,    //通道4第6步完成
    CSS_Ch4Step7Success,    //通道4第7步完成
    CSS_Ch4Step8Success,    //通道4第8步完成
    CSS_Ch4Step9Success,    //通道4第9步完成
    CSS_Ch4Step10Success,    //通道4第10步完成
    CSS_SelfTest,               //开机自检
    CSS_Selfcover,          //舱门自检
    CSS_SelfZcan,           //z轴自检
    CSS_SelfYcan,           //Y轴自检
    CSS_SelfXcan,           //x轴自检
    CSS_SelfRampump,        //柱塞泵自检
    CSS_TipTestSuccess,         //tip检测完成
    CSS_cover_close,            //提示关闭舱门
    CSS_selftest_over,          //自检结束
    CSS_addTip                  //提示补tip

};

//  工作状态，用于数据管理软件作区别
enum WorkStatus
{
    WS_NONE,                       //对应数据管理软件的3个状态，若其中一边变化，注意统一！！！
    WS_FREE,                       //空闲
    WS_BUSY,                       //采集中
    WS_ALM,                        //采集中
};

#endif // STATUSDEFINE_H
