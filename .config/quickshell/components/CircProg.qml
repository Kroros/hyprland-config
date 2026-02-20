import QtQuick
import QtQuick.Shapes

Shape {
    id: root;

    property real value;
    property int startAngle: 0;
    property int strokeWidth;
    property int spacing: 0;
    property int padding: 2;
    property color fgColour: Colours.primary;
    property color bgColour: Qt.rgba(0.5, 0.5, 0.5, 1);
    property int size;

    readonly property real arcRadius: (size - padding - strokeWidth) / 2;
    readonly property real vValue: value || 1/360;
    readonly property real gapAngle: ((spacing + strokeWidth) / (arcRadius || 1)) * (180 / Math.PI);

    preferredRendererType: Shape.CurveRenderer;
    asynchronous: true;

    ShapePath {
        fillColor: "transparent";
        strokeColor: root.bgColour;
        strokeWidth: root.strokeWidth;
        capStyle: ShapePath.FlatCap;

        PathAngleArc {
            startAngle: root.startAngle + 360 * root.vValue + root.gapAngle;
            sweepAngle: 360;
            radiusX: root.arcRadius;
            radiusY: root.arcRadius;
            centerX: root.size / 2;
            centerY: root.size / 2;
        }
    }

    ShapePath {
        fillColor: "transparent";
        strokeColor: root.fgColour;
        strokeWidth: root.strokeWidth;
        capStyle: ShapePath.FlatCap;

        PathAngleArc {
            startAngle: root.startAngle;
            sweepAngle: -360 * root.vValue;
            radiusX: root.arcRadius;
            radiusY: root.arcRadius;
            centerX: root.size / 2;
            centerY: root.size / 2;
        }
    }
}
