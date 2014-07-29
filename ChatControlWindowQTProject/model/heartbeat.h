#ifndef HEARTBEAT_H
#define HEARTBEAT_H

#include <QObject>
#include <QTimer>

class Heartbeat : public QObject
{
    Q_OBJECT
public:
    explicit Heartbeat(/*QObject *ControllerInterface = 0,*/ int interval);

    signals:
        void started();
        void stopped();

    public slots:
        void start();
        void stop();

    private:
        //ControllerInterface* client;
        QTimer *timer;

    private slots:
        void sendHeartbeat();

};




#endif // HEARTBEAT_H
