import QtQuick
import QtQuick.Shapes

Shape {
	id: root
	required property real radius
	required property real thickness
	property alias backgroundColor: background.strokeColor
	property alias color: progress.strokeColor
	property real percent
	readonly property real capAngle: Math.asin((thickness / 2) / radius) * 180 / Math.PI
	asynchronous: true
	preferredRendererType: Shape.CurveRenderer

	component Ring: ShapePath {
		id: ring
		required property real radius
		required property real thickness
		property alias startAngle: arc.startAngle
		property alias sweepAngle: arc.sweepAngle
		capStyle: ShapePath.RoundCap
		fillColor: "transparent"
		pathHints: ShapePath.PathConvex | ShapePath.PathSolid | ShapePath.PathNonIntersecting
		strokeWidth: thickness

		PathAngleArc {
			id: arc
			centerX: ring.radius + ring.thickness / 2
			centerY: ring.radius + ring.thickness / 2
			radiusX: ring.radius
			radiusY: ring.radius
		}
	}

	Ring {
		id: background
		radius: root.radius
		thickness: root.thickness
		sweepAngle: 360
	}

	Ring {
		id: progress
		radius: root.radius
		thickness: root.thickness
		startAngle: -90 + root.capAngle
		sweepAngle: root.percent >= 1 ? Math.max(1, 360 * root.percent / 100 - 2 * root.capAngle) : 0
	}
}
