#include <QSqlError>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QUuid>
#include <QDebug>
#include "sqlquerymodel.h"
#include "cfg.h"
#include "datastorage.h"
#include <QSqlRecord>
#include <QSqlField>
#include <QTimer>

SqlQueryModel::SqlQueryModel(QObject *parent)
    : QSqlQueryModel(parent)
{

}

SqlQueryModel::~SqlQueryModel()
{
}

QHash<int, QByteArray> SqlQueryModel::roleNames() const
{
    QHash<int, QByteArray> roles;

    QSqlRecord record = this->record();
    for (int i = 0; i < record.count(); ++i)
    {
        roles.insert(Qt::UserRole + 1 + i, record.fieldName(i).toUtf8());
    }

    return roles;
}

QVariant SqlQueryModel::data(const QModelIndex &index, int role) const
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

void SqlQueryModel::nameTbFresh()
{
    this->clear();
    this->setQuery( "SELECT * FROM " + DataStorage::getInstance().getTableName(NAME_TB));
}

void SqlQueryModel::alarmTbFresh()
{
    this->clear();
    this->setQuery( "SELECT * FROM " + DataStorage::getInstance().getTableName(LOG_TB)+ " ORDER BY starttime DESC" );
}

void SqlQueryModel::techTbFresh(QString newValue)
{
    this->clear();
    this->setQuery( "SELECT * FROM " + DataStorage::getInstance().getTableName(TECH_TB)
                    + QString(" where techname='%1' ").arg( newValue ) + " ORDER BY steps ASC");
}

void SqlQueryModel::techAllFrech()
{
    this->clear();
    this->setQuery( "SELECT * FROM " + DataStorage::getInstance().getTableName(TECH_TB)
/*                     + " ORDER BY steps ASC"*/);
}

void SqlQueryModel::techClear()
{
    this->clear();
}
