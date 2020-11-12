import QtQuick 2.0
import QtQuick.Controls 1.2
import "."

Rectangle {
    id: chart
    width: parent.width
    height: parent.height
    color: "#dcdcdc"

    property int xAxisLen: 100
    property int gridSize: 10           //横坐标个数
    property real gridStep: gridSize ? (width - canvas.tickMargin) / gridSize : canvas.xGridStep
    property int hGridlineNum: 15       //纵坐标个数
    property alias canvas: canvas

    function update() {
        canvas.requestPaint();
    }

    Canvas {
        id: canvas
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        //width: Screen.primaryOrientation === Qt.PortraitOrientation ? parent.width - 40 : 0.6 * parent.width

        property int pixelSkip: 1
        property int numPoints: 1
        property int tickMargin: 34

        property real xGridStep: (width - tickMargin) / numPoints
        property real yGridOffset: height / (hGridlineNum + 1) * 2
        property real yGridStep: height / hGridlineNum

        function drawBackground(ctx) {
            ctx.save();
            ctx.fillStyle = "#ffffff";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            ctx.strokeStyle = "#d7d7d7";
            ctx.beginPath();
            // Horizontal grid lines
            for (var i = 0; i < hGridlineNum + 1; i++) {     
                ctx.moveTo(0, i * canvas.yGridStep);
                ctx.lineTo(canvas.width - 5, i * canvas.yGridStep);
            }

            // Vertical grid lines
            var height = 35 * canvas.height / 36;
            var yOffset = canvas.height - height;
            var xOffset = 0;
            for (i = 0; i < chart.gridSize + 1; i++) {
                ctx.moveTo(i * chart.gridStep, 0);
                ctx.lineTo(i * chart.gridStep, canvas.height);
            }
            ctx.stroke();
            ctx.restore();
        }

        // Returns a shortened, readable version of the potentially
        // large volume number.
        function volumeToString(value) {
            if (value < 1000)
                return value;
            var exponent = parseInt(Math.log(value) / Math.log(1000));
            var shortVal = parseFloat(parseFloat(value) / Math.pow(1000, exponent)).toFixed(1);

            // Drop the decimal point on 3-digit values to make it fit
            if (shortVal >= 100.0) {
                shortVal = parseFloat(shortVal).toFixed(0);
            }
            return shortVal + "KMBTG".charAt(exponent - 1);
        }

        function drawScales(ctx, high, low, vol)
        {
            ctx.save();
            ctx.strokeStyle = "#888888";
            //ctx.font = "10px Times"
            ctx.beginPath();

            // prices on y-axis
            var x = 3;
            var priceStep = (high - low) / 9.0;
            for (var i = 0; i < 15; i ++) {
                var price = parseFloat(high - i * priceStep).toFixed(0);
                ctx.text(price, x, i * yGridStep);
            }
/*
            // volume scale
            for (i = 0; i < 3; i++) {
                var volume = volumeToString(vol - (i * (vol/3))).toFixed(2);
                ctx.text(volume, x,(i + 9) * yGridStep - 2);
            }
*/
            ctx.closePath();
            ctx.stroke();
            ctx.restore();
        }
/////////////////////画折线
        function drawPrice(ctx, from, to, color, points, highest, lowest)
        {
            ctx.save();
            ctx.globalAlpha = 0.7;
            ctx.strokeStyle = color;
            ctx.lineWidth = 1;
            ctx.beginPath();

            var end = points.length;

            var range = highest - lowest;
            if (range == 0) {
                range = 1;
            }

            for (var i = 0; i < end; i += pixelSkip) {
                var x = points[i].x;
                var y = points[i].y;
                var h = 9 * yGridStep;

                y = h * (lowest - y)/range + h + yGridOffset;

                if (i == 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();
            ctx.restore();
        }

        function drawError(ctx, msg)
        {
            ctx.save();
            ctx.strokeStyle = "#888888";
            //ctx.font = "24px Times"
            ctx.textAlign = "center"
            ctx.shadowOffsetX = 4;
            ctx.shadowOffsetY = 4;
            ctx.shadowBlur = 1.5;
            ctx.shadowColor = "#aaaaaa";
            ctx.beginPath();

            ctx.fillText(msg, (canvas.width - tickMargin) / 2,
                              (canvas.height - yGridOffset - yGridStep) / 2);

            ctx.closePath();
            ctx.stroke();
            ctx.restore();
        }

        onPaint: {
            numPoints = 20;

            var ctx = canvas.getContext("2d");
            ctx.globalCompositeOperation = "source-over";
            ctx.lineWidth = 1;

            drawBackground(ctx);

            if (!numPoints) {
                drawError(ctx, "No data available.");
                return;
            }

            //var points = DataGenerate.points;
            var points = [];
            for (var i = numPoints, j = 0; i >= 0 ; i -= pixelSkip, j += pixelSkip) {
                var range = 50;
                var rand = Math.random();
                var price = Math.round(rand * range);
                points.push({
                                x: j * xGridStep,
                                y: price
                            });
            }
            drawPrice(ctx, 0, numPoints, "#2E8B57", points, 50, 0);
            drawScales(ctx, 500, 0, 35);
        }
    }
}
