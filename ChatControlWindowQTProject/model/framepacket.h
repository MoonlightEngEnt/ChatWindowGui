#ifndef FRAMEPACKET_H
#define FRAMEPACKET_H

#include <QObject>
#include <QStringList>
enum FrameType{
    RX_PACKET,
    TX_PACKET,
    RX_ERROR,
    TX_ERROR,
    BEACON
};


class FramePacket : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList packetData
               READ packetData
               WRITE setPacketData
               NOTIFY packetDataChanged)

public:
    explicit FramePacket(QObject *parent = 0);

    QStringList packetData() const;



signals:
    void packetDataChanged();

public slots:
    void setPacketData(QStringList data);
private:
    QStringList _packetData;

};

#endif // FRAMEPACKET_H
