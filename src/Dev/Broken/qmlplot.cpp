#include "qmlplot.h"
#include "qcustomplot.h"
#include <QDebug>
#include "src/ParamMgr/parammgr.h"
DDuiBasePlotItem::DDuiBasePlotItem( QQuickItem* parent ) : QQuickPaintedItem( parent )
  , m_CustomPlot( new QCustomPlot() )
{
    setFlag( QQuickItem::ItemHasContents, true );
    setAcceptedMouseButtons( Qt::AllButtons );
    setAcceptHoverEvents(true);

    connect( this, &QQuickPaintedItem::widthChanged, this, &DDuiBasePlotItem::updateCustomPlotSize );
    connect( this, &QQuickPaintedItem::heightChanged, this, &DDuiBasePlotItem::updateCustomPlotSize );
}

DDuiBasePlotItem::~DDuiBasePlotItem()
{
    delete m_CustomPlot;
    m_CustomPlot = nullptr;
}

void DDuiBasePlotItem::paint( QPainter* painter )
{
    if (m_CustomPlot)
    {
        QPixmap    picture( boundingRect().size().toSize() );
        QCPPainter qcpPainter( &picture );

        m_CustomPlot->toPainter( &qcpPainter );

        painter->drawPixmap( QPoint(), picture );
    }
}

QCustomPlot *DDuiBasePlotItem::getPlot()
{
    if( !m_CustomPlot){
        m_CustomPlot = new QCustomPlot;
    }
    return m_CustomPlot;
}

void DDuiBasePlotItem::mousePressEvent( QMouseEvent* event )
{
//    qDebug() << Q_FUNC_INFO;
//    routeMouseEvents( event );
}

void DDuiBasePlotItem::mouseReleaseEvent( QMouseEvent* event )
{
//    qDebug() << Q_FUNC_INFO;
//    routeMouseEvents( event );
}

void DDuiBasePlotItem::mouseMoveEvent( QMouseEvent* event )
{
//    qDebug() << Q_FUNC_INFO;
//    routeMouseEvents( event );
}

void DDuiBasePlotItem::mouseDoubleClickEvent( QMouseEvent* event )
{
//    qDebug() << Q_FUNC_INFO;
//    routeMouseEvents( event );
}

void DDuiBasePlotItem::wheelEvent( QWheelEvent *event )
{
    routeWheelEvents( event );
}
void DDuiBasePlotItem::graphClicked( QCPAbstractPlottable* plottable )
{
    qDebug() << Q_FUNC_INFO << QString( "Clicked on graph '%1 " ).arg( plottable->name() );
}

void DDuiBasePlotItem::routeMouseEvents( QMouseEvent* event )
{
    if (m_CustomPlot)
    {
        QMouseEvent* newEvent = new QMouseEvent( event->type(), event->localPos(), event->button(), event->buttons(), event->modifiers() );
        QCoreApplication::postEvent( m_CustomPlot, newEvent );
    }
}

void DDuiBasePlotItem::routeWheelEvents( QWheelEvent* event )
{
    if (m_CustomPlot)
    {
        QWheelEvent* newEvent = new QWheelEvent( event->pos(), event->delta(), event->buttons(), event->modifiers(), event->orientation() );
        QCoreApplication::postEvent( m_CustomPlot, newEvent );
    }
}

void DDuiBasePlotItem::hoverMoveEvent(QHoverEvent *event)
{
    //qDebug() << Q_FUNC_INFO<<event->pos();
}

void DDuiBasePlotItem::updateCustomPlotSize()
{
    if (m_CustomPlot)
    {
        m_CustomPlot->setGeometry(0, 0, (int)width(), (int)height());
        m_CustomPlot->setViewport(QRect(0, 0, (int)width(), (int)height()));
    }
}

void DDuiBasePlotItem::onCustomReplot()
{
    //qDebug() << Q_FUNC_INFO;
    update();
}

CustomPlotPressure::CustomPlotPressure( QQuickItem* parent ) : DDuiBasePlotItem( parent )
  , m_timerId( 0 )
{
/*    connect( ParamMgr::getInstance(), &ParamMgr::proDuctScaleChanged, this, &CustomPlotPressure::onProDuctScaleChanged);
    connect( ParamMgr::getInstance(), &ParamMgr::sampleScaleChanged, this, &CustomPlotPressure::onSampleScaleChanged);
    connect( ParamMgr::getInstance(), &ParamMgr::dpmChanged, this, &CustomPlotPressure::onDpmChanged);            //管路压力
    connect( ParamMgr::getInstance(), &ParamMgr::dpumpDPMChanged, this, &CustomPlotPressure::onDpumpDPMChanged);//离心桶压力
    connect( ParamMgr::getInstance(), &ParamMgr::centrifugalForceChanged, this, &CustomPlotPressure::onCentrifugalForceChanged);  */  //离心桶转速

}

CustomPlotPressure::~CustomPlotPressure()
{
    if(m_timerId != 0) {
        killTimer(m_timerId);
    }
}

void CustomPlotPressure::initCustomPlotPressure()
{
    t = 0;
    updateCustomPlotSize();
    getPlot()->clearGraphs();
    //Init Font
    QFont font[6]={QFont("微软雅黑",24),QFont("微软雅黑",15)};
    font[0].setPixelSize(24);
    font[1].setPixelSize(15);

    // 设置图例行优先排列
    getPlot()->legend->setFillOrder(QCPLayoutGrid::foColumnsFirst);
    // 设置六个图例自动换行
    getPlot()->legend->setWrap(1);
    // 设置图例可见
    getPlot()->legend->setVisible(true);
    // 设置显示比例
//    getPlot()->plotLayout()->setRowStretchFactor(1, 0.001);
    getPlot()->legend->setFont(font[1]);
    // 设置边框隐藏
//    getPlot()->legend->setBorderPen(Qt::NoPen);
    getPlot()->axisRect()->insetLayout()->setInsetAlignment(0, Qt::AlignLeft|Qt::AlignTop);
    getPlot()->legend->setBrush(QColor(255,255,255,0));
    getPlot()->addGraph();
    getPlot()->graph( 0 )->setPen( QPen( Qt::black ) );
//    getPlot()->graph(0)->setName("Rn");

    QLinearGradient plotGradient;
    plotGradient.setStart(0, 0);
    plotGradient.setFinalStop(0, 350);
    plotGradient.setColorAt(0, QColor(248,248,255));
    plotGradient.setColorAt(1, QColor(248,248,255));
    getPlot()->setBackground(plotGradient);      // 设置背景颜色
    getPlot()->xAxis->setLabel( "循环数" );
    getPlot()->xAxis->setLabelFont(font[0]);
    getPlot()->xAxis->setTickLabelFont(font[1]);
    getPlot()->yAxis->setLabel( "Rn" );
    getPlot()->yAxis->setLabelFont(font[0]);
    getPlot()->yAxis->setTickLabelFont(font[1]);
//    getPlot()->yAxis->setRange( -750, 1000 );

    m_timerId = startTimer(200);

    connect( getPlot(), &QCustomPlot::afterReplot, this, &CustomPlotPressure::onCustomReplot );

    getPlot()->replot();
//    qDebug() << Q_FUNC_INFO ;
}

void CustomPlotPressure::timerEvent(QTimerEvent *event)
{
    getPlot()->graph(0)->addData(t, dpm);
    t+=0.2;

    getPlot()->xAxis->setRange( 0, t );
    getPlot()->replot();
//        qDebug() << Q_FUNC_INFO << QString("Adding dot t = %1, S = %2").arg(t).arg(U);
}

void CustomPlotPressure::saveCustomPlotPressure()
{
    getPlot()->savePng("pressure.png",2229,1800);
    t = 0;
    if(m_timerId != 0) {
        killTimer(m_timerId);
    }
}

//void CustomPlotPressure::onProDuctScaleChanged(qint16 newValue)
//{
//    ProDuct = QString::number(newValue/10).toDouble();
//}

//void CustomPlotPressure::onSampleScaleChanged(qint16 newValue)
//{
//    sample = QString::number(newValue/10).toDouble();
//}

//void CustomPlotPressure::onDpmChanged(QString newValue)
//{

//    dpm = newValue.toDouble();
//}

//void CustomPlotPressure::onDpumpDPMChanged(QString newValue)
//{
//    dpumpdpm = newValue.toDouble();
//}

//void CustomPlotPressure::onCentrifugalForceChanged(qint16 newValue)
//{
//    Force = QString::number(newValue/10).toDouble();
//}
