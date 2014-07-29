#ifndef CONTROLLERINTERFACE_H
#define CONTROLLERINTERFACE_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTcpSocket>
#include <QNetworkSession>
#include <QNetworkConfigurationManager>
#include <QSettings>
#include <QDialog>
#include <QTcpServer>
#include <QUdpSocket>

#include "GuiControllerCommon.h"

class ControllerInterface : public QObject
{
        Q_OBJECT
signals:
    void addPacketData(QStringList data);
public:
    ControllerInterface();
private slots:
    //Client Receiver
    void receiveMessage();
    void receiveFramePacketData(QStringList data);

    //Client Sender
    void sendMessage();

    void sendCleaning();
private:
    //Client Receiver
    QUdpSocket *udpSocket;

    //Client Sender
    QUdpSocket *udpSocketSender;
    transporter d;
};

#endif // CONTROLLERINTERFACE_H
