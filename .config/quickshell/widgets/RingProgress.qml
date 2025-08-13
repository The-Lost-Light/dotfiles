import QtQuick
import QtQuick.Shapes

Shape {
	id: root
	required property real radius
	required property real thickness
	property alias backgroundColor: background.strokeColor
	property alias color: progress.strokeColor
	property real percent: 100
	anchors.fill: parent
	asynchronous: true
	antialiasing: true

	component Ring: ShapePath {
		id: ring
		required property real percent
		required property real radius
		required property real thickness
		capStyle: ShapePath.RoundCap
		fillColor: "transparent"
		pathHints: ShapePath.PathConvex | ShapePath.PathSolid | ShapePath.PathNonIntersecting
		strokeWidth: thickness

		PathAngleArc {
			centerX: ring.radius + ring.thickness
			centerY: ring.radius + ring.thickness
			radiusX: ring.radius
			radiusY: ring.radius
			startAngle: -90
			sweepAngle: 360 * ring.percent / 100
		}
	}

	Ring {
		id: background
		radius: root.radius
		thickness: root.thickness
		percent: 360
	}

	Ring {
		id: progress
		radius: root.radius
		thickness: root.thickness
		percent: root.percent
	}
}
