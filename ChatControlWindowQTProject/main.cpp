#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtDeclarative/qdeclarative.h>
#include <QtDeclarative/QDeclarativeEngine>
#include "controllerinterface.h"
#include "./model/controlwindowmodel.h"
#include "./model/framepacket.h"
#include "./model/framepackettype.h"

#define ENUM_TYPES "enumTypes"
//#include "quickTest.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    ControllerInterface client;
    QQmlApplicationEngine engine;
    ControlWindowModel controlModel;
    FramePacket framePacket;
    QObject::connect(&controlModel, SIGNAL(addFrame()), &client, SLOT(sendCleaning()));
//    QObject::connect(&client, SIGNAL(addPacketData(QStringList)), &framePacket, SLOT(setPacketData(QStringList)));

//    quick::UeStatus* status = quick::GetUeStatus();
//    qDebug() << "Net: " << status->GetNet();
//    qDebug() << "\nNetwork Present: " << status->GetNetworkPresent();
//    qDebug() << "\nOn Net: " << status->GetOnNet();
//    qDebug() << "\nRSSI: " << status->GetRssi();
//    qDebug() << "\nSignal Quality: " << status->GetSigQual();
//    qDebug() << "\nUE Attached: " << status->GetUeAttached();
//    qDebug() << "\nUE Hearbeat: " << status->GetUeHeartbeat();
//    qDebug() << "\nUE Present: " << status->GetUePresent ();
//    status->Release();

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("controlModel",&controlModel);
    context->setContextProperty("framePacket",&framePacket);
//    qmlRegisterUncreatableType<FramePacketType::Type>(ENUM_TYPES, 1, 0, "PacketTypes", "");
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
