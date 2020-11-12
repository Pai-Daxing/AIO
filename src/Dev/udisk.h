#ifndef UDISK_H
#define UDISK_H

#include <QThread>

class uDisk : public QThread
{
    Q_OBJECT
public:

    static uDisk* getInst();
    virtual  ~uDisk();

signals:
    void udiskRemove();
    void udiskAdd();
public slots:

protected:
    explicit uDisk(QObject *parent = 0);

    virtual void run();
};

#endif // UDISK_H
