#ifndef QMLPLOT_H
#define QMLPLOT_H

#include <QtQuick>
class QCustomPlot;
class QCPAbstractPlottable;

class DDuiBasePlotItem : public QQuickPaintedItem
{
    Q_OBJECT
public:
    DDuiBasePlotItem( QQuickItem* parent = 0 );
    virtual ~DDuiBasePlotItem();
    void paint( QPainter* painter );
    virtual void initCustomPlotUI(){}

    QCustomPlot *getPlot();
protected:
    virtual void hoverMoveEvent(QHoverEvent *event);
    virtual void mousePressEvent( QMouseEvent* event );
    virtual void mouseReleaseEvent( QMouseEvent* event );
    virtual void mouseMoveEvent( QMouseEvent* event );
    virtual void mouseDoubleClickEvent( QMouseEvent* event );
    virtual void wheelEvent( QWheelEvent *event );

    void routeMouseEvents( QMouseEvent* event );
    void routeWheelEvents( QWheelEvent* event );
public slots:
    void graphClicked( QCPAbstractPlottable* plottable );
    void onCustomReplot();
    void updateCustomPlotSize();
private:
    QCustomPlot*         m_CustomPlot;
};

class CustomPlotPressure : public DDuiBasePlotItem
{
    Q_OBJECT
public:
    CustomPlotPressure( QQuickItem* parent = 0 );
    virtual ~CustomPlotPressure();
    Q_INVOKABLE void initCustomPlotPressure();
    Q_INVOKABLE void saveCustomPlotPressure();
protected:
    virtual void timerEvent(QTimerEvent *event);
public slots:
//    void onProDuctScaleChanged(qint16 newValue);
//    void onSampleScaleChanged(qint16 newValue);
//    void onDpmChanged(QString newValue);
//    void onDpumpDPMChanged(QString newValue);
//    void onCentrifugalForceChanged(qint16 newValue);
private:
    int                  m_timerId;
    double dpm,t;
};

#endif // QMLPLOT_H
