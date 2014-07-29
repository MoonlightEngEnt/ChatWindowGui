#include "framepacket.h"
#include <QDebug>

FramePacket::FramePacket(QObject *parent) :
    QObject(parent)
{
}
QStringList FramePacket::packetData() const
{
    return _packetData;
}
void FramePacket::setPacketData(QStringList data)
{
    _packetData = data;

    qDebug() << "Got Frame Packet";
    for (int i =0; i < _packetData.length(); i++){
      qDebug() << _packetData[i];
    }
    emit packetDataChanged();
}
