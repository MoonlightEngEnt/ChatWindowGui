#include "heartbeat.h"

Heartbeat::Heartbeat(/*ControllerInterface *client,*/ int interval)
   // :client(client)
{
    timer = new QTimer(this);
    timer->setInterval(interval);
    connect(timer, SIGNAL(timeout()), this, SLOT(sendHeartbeat()));

    // When the client is destroyed, we shouldn't talk to it anymore.
    //connect(client, SIGNAL(destroyed()), this, SLOT(stop()));
}

void Heartbeat::start()
{
    timer->start();
    emit started();
}

void Heartbeat::stop()
{
    timer->stop();
    emit stopped();
}

void Heartbeat::sendHeartbeat()
{
 //   client->sendCommand(UIMessages::Generic(GUI_HEARTBEAT));
}
