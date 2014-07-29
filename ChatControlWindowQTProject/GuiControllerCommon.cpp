#include "GuiControllerCommon.h"
#include <QDataStream>
#include <QtNetwork>

QDataStream &operator<<(QDataStream &out, const transporter &t)
{
    out << (quint32)t.command_id << t.payload_size << t.data;
    return out;
}

QDataStream &operator<<(QDataStream &out, const transporter_stringlist &t)
{
    out << (quint32)t.command_id << t.payload_size << t.data;
//    for(int i=0; i < t.data.size(); i++){
//       out << t.data[i];
//    }
    return out;
}

QDataStream& operator >>(QDataStream& in, command_id_list& e)
{
    quint32 tmp = e;
    in >> tmp;
    return in;
}

QDataStream &operator>>(QDataStream &in, transporter &t)
{
    int id;
    int size;
    QString data;

    in >> id >> size >> data;
    t.command_id = (command_id_list)id;
    t.payload_size = size;
    t.data = data;
    return in;
}
QDataStream &operator>>(QDataStream &in, transporter_stringlist &t)
{
    int id;
    int size;
    QStringList data;
//    QString temp;

    in >> id >> size >> data;
//    for(int i=0; i < t.data.size(); i++){
//       in >> temp;
//    }
    t.command_id = (command_id_list)id;
    t.payload_size = size;
    t.data = data;
    return in;
}
