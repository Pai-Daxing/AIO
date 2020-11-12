TEMPLATE = app

QT += qml quick sql serialport printsupport core gui
CONFIG += c++11

SOURCES += main.cpp \
    src/AlarmMgr/alarmmgr.cpp \
    src/AlarmMgr/alarmstr.cpp \
    src/AlarmMgr/soundlightmgr.cpp \
    src/DataStorage/alarmtable.cpp \
    src/DataStorage/cfg.cpp \
    src/DataStorage/datamgr.cpp \
    src/DataStorage/datastorage.cpp \
    src/DataStorage/dbtable.cpp \
    src/DataStorage/debuglog.cpp \
    src/DataStorage/logdata.cpp \
    src/DataStorage/namedata.cpp \
    src/DataStorage/sqlquerymodel.cpp \
    src/Dev/Broken/qcustomplot.cpp \
    src/Dev/Broken/qmlplot.cpp \
    src/Dev/NetOnline/netonline.cpp \
    src/Dev/Sound/soundthread.cpp \
    src/Dev/Time/time.cpp \
    src/Dev/udisk.cpp \
    src/Keyboard/mykeyboard.cpp \
    src/ParamMgr/parammgr.cpp \
    src/SerialApp/serialapp.cpp \
    src/StatusMgr/statusmgr.cpp \
    src/UI/uiadaptor.cpp \
    src/DataStorage/technologydata.cpp

RESOURCES += qml.qrc

INCLUDEPATH 	+= $$PWD

MOC_DIR         = temp/moc
RCC_DIR         = temp/rcc
UI_DIR          = temp/ui
OBJECTS_DIR     = temp/obj

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

HEADERS += \
    src/AlarmMgr/alarmmgr.h \
    src/AlarmMgr/alarmstr.h \
    src/AlarmMgr/soundlightmgr.h \
    src/DataStorage/alarmtable.h \
    src/DataStorage/cfg.h \
    src/DataStorage/datamgr.h \
    src/DataStorage/datastorage.h \
    src/DataStorage/dbtable.h \
    src/DataStorage/debuglog.h \
    src/DataStorage/logdata.h \
    src/DataStorage/namedata.h \
    src/DataStorage/sqlquerymodel.h \
    src/Dev/Broken/qcustomplot.h \
    src/Dev/Broken/qmlplot.h \
    src/Dev/NetOnline/netonline.h \
    src/Dev/Sound/soundthread.h \
    src/Dev/Time/time.h \
    src/Dev/udisk.h \
    src/Keyboard/mykeyboard.h \
    src/ParamMgr/parammgr.h \
    src/Protocol/alarms.h \
    src/Protocol/commands.h \
    src/Protocol/ProtocolAPI.h \
    src/Protocol/status.h \
    src/Protocol/types.h \
    src/SerialApp/serialapp.h \
    src/StatusMgr/statusmgr.h \
    src/UI/uiadaptor.h \
    src/global.h \
    src/DataStorage/technologydata.h
