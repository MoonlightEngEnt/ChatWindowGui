#include "listmodelccw.h"

#define INDEX_INVALID(x) (x < 0 || x >= _list.size())

ListModelCCW::ListModelCCW(QObject *parent) :
    QAbstractListModel(parent)
{
    connect(this, SIGNAL(rowsInserted(QModelIndex const&, int, int)),
            this, SIGNAL(countChanged()));
    connect(this, SIGNAL(rowsRemoved(QModelIndex const&, int, int)),
            this, SIGNAL(countChanged()));
}

ListModelCCW::~ListModelCCW()
{
    _list.clear();
}

int ListModelCCW::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    return _list.length();
}

QVariant ListModelCCW::data(const QModelIndex &index, int role) const
{
    if (INDEX_INVALID(index.row())) {
        return QVariant();
    }

    return _list.at(index.row())->data(role);
}

bool ListModelCCW::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (INDEX_INVALID(index.row())) {
        return false;
    }

    bool ret = _list.at(index.row())->setData(role, value);

    if (ret) {
        emit dataChanged(index, index);
    }

    return ret;
}

Qt::ItemFlags ListModelCCW::flags(const QModelIndex &index) const
{
    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}

int ListModelCCW::count() const
{
    return rowCount(QModelIndex());
}

void ListModelCCW::clear()
{
    beginRemoveRows(QModelIndex(), 0, _list.size());

    _list.clear();

    endRemoveRows();
}

void ListModelCCW::removeItems(int index)
{
    beginRemoveRows(QModelIndex(), index, index);

    _list.removeAt(index);

    endRemoveRows();
}

bool ListModelCCW::setData(int row, const QString &field, const QVariant &value)
{
    // Slow! But thankfully, we don't have a lot of data.
    int role;
    bool success;

    if (row < 0 || row >= _list.count()) {
        return false;
    }

    role = roleNames().key(field.toLatin1());
    success = _list.at(row)->setData(role, value);
    if (success) {
        QModelIndex const& in = index(row);
        emit dataChanged(in, in);
    }
    return success;
}

const QVariant ListModelCCW::data(int row, const QString &field)
{
    if (row < 0 || row >= _list.count()) {
        return QVariant();
    }

    // Slow! But thankfully, we don't have a lot of data.
    int role = roleNames().key(field.toLatin1());
    return _list.at(row)->data(role);
}
