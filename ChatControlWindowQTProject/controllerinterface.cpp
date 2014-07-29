#include "controllerinterface.h"
#include <QtWidgets>
#include <QtNetwork>
#include <QTimer>
#include <iostream>
using namespace std;


ControllerInterface::ControllerInterface()
{

    udpSocket = new QUdpSocket(this);
    udpSocket->bind( 54499, QUdpSocket::ShareAddress);
    connect(udpSocket, SIGNAL(readyRead()), this, SLOT(receiveMessage()));

    //Client Sender
    udpSocketSender = new QUdpSocket(this);
    //connect(ui->sendMessageButton, SIGNAL(clicked()), this, SLOT(sendMessage()));
}
void ControllerInterface::sendCleaning()
{
    d.data = "Cleaning....";
    d.payload_size = d.data.size();

    QByteArray dgram;
    quint32 tmp =GUI_CLEANING;
    qDebug() << "Sending UDP: " << GUI_CLEANING << " " << d.data;

    QDataStream out(&dgram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_4_3);
    out << QString::number(tmp) <<  QString::number(d.payload_size) << d.data;
    udpSocketSender->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54498 );
}
void ControllerInterface::receiveMessage()
{



    while(udpSocket->hasPendingDatagrams()){
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        udpSocket->readDatagram(datagram.data(),datagram.size());
        for(int i=0; i < datagram.size(); i++) {
            qDebug() << "Reading: "  << i << " " << datagram.at(i);
        }
        transporter f;
        QString t1, t2;
        QDataStream in(&datagram, QIODevice::ReadOnly);
        in.setVersion(QDataStream::Qt_4_3);
        in >> t1;
        if (t1.toInt() == CTR_ADD_FRAME){
            QStringList t3;
           in >> t2 >> t3;

            qDebug() << "Reading UDP: " << t1 << " " << t3;
            emit addPacketData(t3);

        }else{
            QString t3;
           in >> t2 >> t3;
           qDebug() << "Reading UDP: " << t1 << " " << t3;
        }





    }



}

void ControllerInterface::sendMessage()
{
    d.data = "ERROR Here";
    d.payload_size = d.data.size();

    QByteArray dgram;
    qDebug() << "Sending UDP: " << CTR_SEND_STARTED << " " << d.data;
    quint32 tmp =CTR_SEND_STARTED;
    QDataStream out(&dgram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_4_3);
    out << QString::number(tmp) <<  QString::number(d.payload_size) << d.data;
    udpSocketSender->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54499 );


}
void ControllerInterface::receiveFramePacketData(QStringList data)
{

}
