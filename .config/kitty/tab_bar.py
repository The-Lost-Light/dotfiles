from kitty.boss import get_boss
from kitty.fast_data_types import Screen
from kitty.rgb import to_color
from kitty.tab_bar import (
	DrawData,
	ExtraData,
	Formatter,
	TabBarData,
	draw_tab_with_separator,
	draw_attributed_string,
	as_rgb,
)


def draw_tab(
	draw_data: DrawData,
	screen: Screen,
	tab: TabBarData,
	before: int,
	max_tab_length: int,
	index: int,
	is_last: bool,
	extra_data: ExtraData,
) -> int:
	if not (is_last and index == 1):
		draw_tab_with_separator(draw_data, screen, tab, before, max_tab_length, index, is_last, extra_data)
	if is_last:
		draw_right_status(draw_data, screen)
	return screen.cursor.x


def get_active_process_name_cell() -> str:
	boss = get_boss()
	if not boss:
		return ""

	window = getattr(boss, "active_window", None)
	if not window or not hasattr(window, "child") or not hasattr(window.child, "foreground_processes"):
		return ""

	foreground_processes = window.child.foreground_processes
	if not foreground_processes or not isinstance(foreground_processes, list):
		return ""

	cmdline = foreground_processes[0].get("cmdline") if len(foreground_processes) > 0 else None
	if not cmdline or not isinstance(cmdline, list) or len(cmdline) == 0:
		return ""

	process_name = cmdline[0].rsplit("/", 1)[-1]
	return process_name


def draw_right_status(draw_data: DrawData, screen: Screen) -> None:
	draw_attributed_string(Formatter.reset, screen)

	process = get_active_process_name_cell()
	right_status_length = 4 + len(process)
	screen.cursor.x = screen.columns - right_status_length

	screen.cursor.fg = as_rgb(int(draw_data.active_bg))
	screen.draw("")

	screen.cursor.bg = as_rgb(int(draw_data.active_bg))
	screen.cursor.fg = 1
	screen.draw(" ")

	screen.cursor.bg = as_rgb(int(to_color("#383444")))
	screen.cursor.fg = 3
	screen.draw(' ' + process)


def _redraw_tab_bar(timer_id):
	for tm in get_boss().all_tab_managers:
		tm.mark_tab_bar_dirty()
