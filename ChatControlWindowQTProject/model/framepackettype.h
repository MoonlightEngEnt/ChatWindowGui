#ifndef FRAMEPACKETTYPE_H
#define FRAMEPACKETTYPE_H

#include <QObject>

class FramePacketType : public QObject
{
    Q_OBJECT

    Q_ENUMS(Type)

public:
    enum Type {
        RX_PACKET,
        TX_PACKET,
        RX_ERROR,
        TX_ERROR,
        BEACON
    };

};

#endif // FRAMEPACKETTYPE_H
