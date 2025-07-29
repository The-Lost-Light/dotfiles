pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import qs.widgets

Popup {
	id: root
	property alias menu: initialItem.menu
	child: wrapMenu

	WrapperRectangle {
		id: wrapMenu
		color: "#1e1e2e"
		margin: 8
		radius: 8
		implicitWidth: stackView.currentItem?.implicitWidth
		implicitHeight: stackView.currentItem?.implicitHeight

		StackView {
			id: stackView
			anchors.fill: parent
			initialItem: SubMenu {
				id: initialItem
			}
		}
	}

	component SubMenu: Column {
		id: column
		property alias menu: menuOpener.menu
		property bool isSubMenu: false
		padding: 8

		QsMenuOpener {
			id: menuOpener
		}

		Repeater {
			model: menuOpener.children

			Loader {
				id: loader
				required property QsMenuEntry modelData
				asynchronous: true
				sourceComponent: {
					let entry = modelData
					if (entry.isSeparator) return separator;
					switch (entry.buttonType) {
						case QsMenuButtonType.CheckBox:	return checkBox;
						case QsMenuButtonType.RadioButton: return radioButton;
						default: return button;
					}
				}

				Component {
					id: separator
					Item {
						implicitHeight: 8
						implicitWidth: 1
					}
				}

				Component {
					id: button

					Button {
						property QsMenuEntry entry: loader.modelData
						background: null
						enabled: entry.enabled
						icon {
							height: 8
							source: entry.icon
						}
						text: entry.text
						onClicked: column.trigger(entry)
					}
				}

				Component {
					id: checkBox

					CheckBox {
						id: cb
						property QsMenuEntry entry: loader.modelData
						background: null
						tristate: true
						checkState: entry.checkState
						enabled: entry.enabled
						icon {
							height: 8
							source: entry.icon
						}
						text: entry.text
						indicator: Indicator {
							entry: cb.entry
						}
						onClicked: column.trigger(entry)
					}
				}

				Component {
					id: radioButton

					RadioButton {
						id: rb
						property QsMenuEntry entry: loader.modelData
						background: null
						checked: entry.checkState > 0
						enabled: entry.enabled
						icon {
							height: 8
							source: entry.icon
						}
						text: entry.text
						indicator: Indicator {
							entry: rb.entry
						}
						onClicked: column.trigger(entry)
					}
				}
			}
		}

		Loader {
			active: column.isSubMenu
			sourceComponent: Button {
				background: null
				text: "Back"
				onClicked: stackView.pop()
			}
		}

		function trigger(entry) {
			entry.triggered();
			if (entry.hasChildren) stackView.pushItem(subMenu, {
				menu: entry,
				isSubMenu: true
			});
			else {
				root.visible = false;
				stackView.replace(subMenu, {
					menu: column.menu
				}, StackView.Immediate);
			}
		}
	}

	Component {
		id: subMenu

		SubMenu {}
	}

	component Indicator: Circle {
		id: indicator
		required property QsMenuEntry entry
		anchors.verticalCenter: parent.verticalCenter
		color: "white"
		border.color: entry.checkState ? "dodgerblue" : "gray"
		border.width: 1
		x: 4
		radius: 8

		Circle {
			anchors.centerIn: parent
			color: "dodgerblue"
			radius: 4
			visible: indicator.entry.checkState
		}
	}

	function toggle() {
		root.visible = !root.visible;
	}
}
