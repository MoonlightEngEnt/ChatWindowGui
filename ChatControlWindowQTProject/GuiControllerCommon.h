#ifndef GUICONTROLLERCOMMON_H
#define GUICONTROLLERCOMMON_H

#include <stdint.h>

#include <QtGui>
#include <QByteArray>
#include <QDataStream>


typedef enum command_id_list {
    //GUI_  are messages from Gui to controller
        GUI_REQUEST_START,
        GUI_CLEANING,
        GUI_REQUEST_FRAME,
        GUI_HEARTBEAT,
        GUI_REQUEST_SIGNAL_STRENGTH,

    //CTR are messages from controller to GUI
        CTR_SEND_STARTED,
        CTR_CLEANING_DONE,
        CTR_SYSTEM_ERROR,
        CTR_ADD_FRAME
} interface_id;

typedef struct payload_tranport{
    interface_id command_id;
    int payload_size;
    QString data;

} transporter;

typedef struct payload_tranport_stringlist{
    interface_id command_id;
    int payload_size;
    QStringList data;

} transporter_stringlist;
QDataStream &operator<<(QDataStream &out, const transporter &t);
QDataStream &operator>>(QDataStream &in, transporter &t);

#endif // GUICONTROLLERCOMMON_H
