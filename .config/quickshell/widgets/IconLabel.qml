import QtQuick
import QtQuick.Controls


Item {
	property alias icon: materialIcon.text
	property alias label: styledLabel.text
	anchors.verticalCenter: parent.verticalCenter
	implicitHeight: row.implicitHeight
	implicitWidth: row.implicitWidth

	Row {
		id: row

		MaterialIcon {
			id: materialIcon
		}

		StyledLabel {
			id: styledLabel
		}
	}
}
