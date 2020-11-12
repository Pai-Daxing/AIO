#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H

#include <QSqlQueryModel>

class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit SqlQueryModel(QObject *parent = nullptr);
    ~SqlQueryModel();

    QHash<int, QByteArray> roleNames() const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

public slots:
    void nameTbFresh(void);
    void techTbFresh(QString newValue);
    void techAllFrech(void);
    void techClear(void);
    void alarmTbFresh(void);
};
#endif // SIMPLEQUERYMODEL_H


