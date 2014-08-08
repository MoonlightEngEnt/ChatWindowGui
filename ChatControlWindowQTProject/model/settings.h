#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int signalStrength READ signalStrength WRITE setSignalStrength NOTIFY signalStrengthChanged)
public:
    explicit Settings(QObject *parent = 0);
    void setSignalStrength(int signal);
    int signalStrength();
signals:
    void signalStrengthChanged();
public slots:

private:
    int _signalStrength;

};

#endif // SETTINGS_H
