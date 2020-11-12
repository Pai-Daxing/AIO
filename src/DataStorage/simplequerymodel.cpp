#include "simplequerymodel.h"
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QUuid>
#include <QDebug>
#include "cfg.h"
#include "datastorage.h"
#include <QSqlRecord>
#include <QSqlField>
#include <QTimer>

simplequerymodel::simplequerymodel(QObject *parent)
    : QSqlQueryModel(parent)
{

}

simplequerymodel::~simplequerymodel()
{
}

QHash<int, QByteArray> simplequerymodel::roleNames() const
{
    QHash<int, QByteArray> roles;

    QSqlRecord record = this->record();
    for (int i = 0; i < record.count(); ++i)
    {
        roles.insert(Qt::UserRole + 1 + i, record.fieldName(i).toUtf8());
    }

    return roles;
}

QVariant simplequerymodel::data(const QModelIndex &index, int role) const
{
    QVariant value = QSqlQueryModel::data(index, role);

    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int column = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), column);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }

    return value;
}

void simplequerymodel::simplefresh()
{
    this->query().clear();
    this->setQuery( "SELECT * FROM " + DataStorage::getInstance().getTableName(SMPL_TB) + " ORDER BY heatV ASC");
}


