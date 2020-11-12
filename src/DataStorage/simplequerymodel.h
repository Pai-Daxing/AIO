#ifndef SIMPLEQUERYMODEL_H
#define SIMPLEQUERYMODEL_H

#include <QSqlQueryModel>

class simplequerymodel : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit simplequerymodel(QObject *parent = 0);
    ~simplequerymodel();

    QHash<int, QByteArray> roleNames() const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

//    Q_INVOKABLE void simplefresh(QString simplename);
//    Q_INVOKABLE void platfresh(QString platname);

signals:
public slots:
    void simplefresh(void);

};

#endif // SIMPLEQUERYMODEL_H
