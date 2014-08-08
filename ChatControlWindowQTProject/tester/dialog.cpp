#include "dialog.h"
#include "ui_dialog.h"
#include <QtWidgets>
#include <QtNetwork>
#include <stdlib.h>
#include <QDebug>
#include "../GuiControllerCommon.h"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{

    ui->setupUi(this);

    ui->enumSelect->addItem("GUI_REQUEST_START");
    ui->enumSelect->addItem("GUI_CLEANING");
    ui->enumSelect->addItem("CTR_SEND_STARTED");
    ui->enumSelect->addItem("CTR_SYSTEM_ERROR");
    ui->enumSelect->addItem("CTR_ADD_FRAME");

    udpSocket = new QUdpSocket(this);

    connect(ui->sendMessageButton, SIGNAL(clicked()), this, SLOT(sendMessage()));

    //Server Receiver
    udpSocketReceiver = new QUdpSocket(this);
    udpSocketReceiver->bind( 54498, QUdpSocket::ShareAddress);
    connect(udpSocketReceiver, SIGNAL(readyRead()), this, SLOT(receiveMessage()));

}

Dialog::~Dialog()
{
    delete ui;
}

 int Dialog::getEnum()
 {
     if (ui->enumSelect->currentText() == "GUI_REQUEST_START"){
      _list.command_id = d.command_id = GUI_REQUEST_START;
       return GUI_REQUEST_START;
     }
     else if (ui->enumSelect->currentText() == "GUI_CLEANING"){
       _list.command_id = d.command_id = GUI_CLEANING;
       return GUI_CLEANING;

       }
     else if (ui->enumSelect->currentText() == "CTR_SEND_STARTED"){
       _list.command_id = d.command_id = CTR_SEND_STARTED;
       return CTR_SEND_STARTED;

       }
     else if (ui->enumSelect->currentText() == "CTR_SYSTEM_ERROR"){
       _list.command_id = d.command_id = CTR_SYSTEM_ERROR;
       return CTR_SYSTEM_ERROR;

     }
     else if (ui->enumSelect->currentText() == "GUI_REQUEST_FRAME"){
       _list.command_id = d.command_id = GUI_REQUEST_FRAME;
       return GUI_REQUEST_FRAME;

     }
     else if (ui->enumSelect->currentText() == "CTR_ADD_FRAME"){
       _list.command_id = d.command_id = CTR_ADD_FRAME;
       return CTR_ADD_FRAME;

     }
 }
 void Dialog::sendMessage()
    {


       //d.data = "ERROR Here";
       // d.payload_size = d.data.size();

     QByteArray dgram;
     QDataStream out(&dgram, QIODevice::WriteOnly);





     if( CTR_ADD_FRAME == getEnum()){
         quint32 tmp =   getEnum();

         out.setVersion(QDataStream::Qt_4_3);
         _list.data.clear();
         _list.data.append(ui->DataOneEdit->text());
         _list.data.append(ui->DataTwoEdit->text());
         _list.data.append(ui->DataThreeEdit->text());
         _list.payload_size = _list.data.size();

         out << QString::number(tmp) <<  QString::number(_list.payload_size) << _list.data;
         qDebug() << "Sending UDP: " << tmp << " " << _list.data;

         udpSocket->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54499 );

     }
 }


 //Server Receiver
 void Dialog::receiveMessage()
 {


     while(udpSocketReceiver->hasPendingDatagrams()){
         QByteArray datagram;
         datagram.resize(udpSocketReceiver->pendingDatagramSize());
         udpSocketReceiver->readDatagram(datagram.data(),datagram.size());
         for(int i=0; i < datagram.size(); i++) {
             qDebug() << "Reading: "  << i << " " << datagram.at(i);
         }
         transporter f;
         QString t1,t2,t3;
         QDataStream in(&datagram, QIODevice::ReadOnly);
         in.setVersion(QDataStream::Qt_4_3);
         in >> t1 >> t2 >> t3;

         qDebug() << "Reading UDP: " << t1 << " " << t3;

         switch(t1.toInt()){
         case GUI_CLEANING:
             ui->statusLabel->setText(t3);

             //Send update to GUI
             QTimer::singleShot(5000, this, SLOT(doneCleaning()));

             break;

         }

     }


 }

 // Mock Interface cide
 void Dialog::doneCleaning(){
     QByteArray dgram;
     d.data = "Done Cleaning!";
     qDebug() << "Sending UDP: " << CTR_CLEANING_DONE << " " << d.data;
     quint32 tmp = CTR_CLEANING_DONE;
     QDataStream out(&dgram, QIODevice::WriteOnly);
     out.setVersion(QDataStream::Qt_4_3);
     out << QString::number(tmp) <<  QString::number(d.data.size()) << d.data;
     udpSocket->writeDatagram(dgram.data(),dgram.size(),QHostAddress::Broadcast,54499 );
     ui->statusLabel->setText(d.data);
 }
