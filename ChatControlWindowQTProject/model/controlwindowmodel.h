#ifndef CONTROLWINDOWMODEL_H
#define CONTROLWINDOWMODEL_H

#include <QObject>

class ControlWindowModel : public QObject
{
    Q_OBJECT
public:
    explicit ControlWindowModel(QObject *parent = 0);

signals:
    void addFrame();
public slots:

};

#endif // CONTROLWINDOWMODEL_H
