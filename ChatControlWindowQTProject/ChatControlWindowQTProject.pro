TEMPLATE = app

QT += qml quick network widgets

SOURCES += main.cpp \
    framelist.cpp \
    controllerinterface.cpp \
    GuiControllerCommon.cpp \
    model/controlwindowmodel.cpp \
    model/heartbeat.cpp \
    model/framepacket.cpp

#win32:CONFIG(release, debug|release): LIBS += -L"C:\Users\blackrue\Documents\Big Bevy Stuff\build-ChatControlWindowQTProject-Desktop_Qt_5_3_MinGW_32bit-Debug\debug\\" -lquickTestDLL
#win32:CONFIG(debug, debug|release): LIBS += -L"C:\Users\blackrue\Documents\Big Bevy Stuff\build-ChatControlWindowQTProject-Desktop_Qt_5_3_MinGW_32bit-Debug\debug" -lquickTestDLL

#LIBS += -L"C:\Users\blackrue\Documents\Big Bevy Stuff\build-ChatControlWindowQTProject-Desktop_Qt_5_3_MinGW_32bit-Debug\debug\quickTestDLL"
RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml/

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES +=
    #qml/Template.qml

HEADERS += \
    framelist.h \
    controllerinterface.h \
    GuiControllerCommon.h \
    model/controlwindowmodel.h \
#    quickTestGlobalDefinitions.h \
#    quickTest.h
    model/heartbeat.h \
    model/framepacket.h \
    model/framepackettype.h
