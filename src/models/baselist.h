#ifndef BASELIST_H
#define BASELIST_H

#include <QObject>
#include "src/utils/pic.h"

class BaseList : public QObject
{
    Q_OBJECT

public:
    explicit BaseList(QObject *parent = nullptr);

    //* To be overrided *//
    virtual PIX::DB_LIST items() const {return PIX::DB_LIST({{}});}


protected:

signals:
    void preItemAppended();
    void postItemAppended();
    void preItemRemoved(int index);
    void postItemRemoved();
    void updateModel(int index, QVector<int> roles);
    void preListChanged();
    void postListChanged();

public slots:
    virtual QVariantMap get(const int &index) const
    {
        Q_UNUSED(index);
        return QVariantMap();
    }

    virtual bool update(const int &index, const QVariant &value, const int &role)
    {
        Q_UNUSED(index);
        Q_UNUSED(value);
        Q_UNUSED(role);
        return false;
    }

    virtual bool update(const QVariantMap &data, const int &index)
    {
        Q_UNUSED(index);
        Q_UNUSED(data);
        return false;
    }

    virtual bool update(const PIX::DB &data)
    {
        Q_UNUSED(data);
        return false;
    }

    virtual bool insert(const QVariantMap &map)
    {
        Q_UNUSED(map);
        return false;
    }

    virtual bool remove(const int &index)
    {
        Q_UNUSED(index);
        return false;
    }
};

#endif // BASELIST_H
