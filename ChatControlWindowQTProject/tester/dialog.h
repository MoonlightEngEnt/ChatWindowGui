#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QTcpServer>
#include <QUdpSocket>
#include <QNetworkSession>
#include "../GuiControllerCommon.h"


namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = 0);
    ~Dialog();

public slots:
    //Server Sender
    void sendMessage();
    int getEnum();

    //Server Receiver
    void receiveMessage();

    //Mock Interface stuff
    void doneCleaning();

private:
    Ui::Dialog *ui;

    //Server Sender
    QUdpSocket *udpSocket;
    transporter d;
    transporter_stringlist _list;

    //Server Receiver
    QUdpSocket *udpSocketReceiver;

};

#endif // DIALOG_H
