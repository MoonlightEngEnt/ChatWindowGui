#ifndef LISTMODELCCW_H
#define LISTMODELCCW_H
#include <QObject>
#include <QVariant>
#include <QSharedPointer>
#include <QAbstractListModel>

class CCWObject : public QObject
{
    Q_OBJECT

public:
    explicit CCWObject(QObject *parent = 0) {};
    virtual ~CCWObject() {};
    virtual QVariant data(int role) const = 0;
    virtual bool setData(int role, QVariant const& value) = 0;
};

    typedef QSharedPointer<CCWObject> CCWObjectPointer;

class ListModelCCW: public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(int count
               READ count
               NOTIFY countChanged)
public:
    explicit ListModelCCW(QObject *parent = 0);
    virtual ~ListModelCCW();
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role);
    virtual Qt::ItemFlags flags(const QModelIndex &index) const;
    int count() const;

    Q_INVOKABLE virtual bool setData(int row, const QString &field, const QVariant &value);
    Q_INVOKABLE virtual const QVariant data(int row, const QString &field);

signals:
    void countChanged();

public slots:
    virtual void clear();
    virtual void removeItems(int index);

protected:
    QList<CCWObjectPointer> _list;


};

#endif // LISTMODELCCW_H
