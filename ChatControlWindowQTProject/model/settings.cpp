#include "settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
}
void Settings::setSignalStrength(int signal)
{
    _signalStrength = signal;
}
int Settings::signalStrength()
{
    return _signalStrength;
}
