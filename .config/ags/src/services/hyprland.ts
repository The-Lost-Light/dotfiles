import { AgsWindow } from "types";

import { Hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";

type fixed = (id?: number) => AgsWindow;
type floating = () => AgsWindow;

export default new (class HyprlandExtends extends Hyprland {
	static {
		Service.register(this, {}, { "active-init-title": ["string", "r"] });
	}

	constructor() {
		super();

		this.active.client.connect("changed", () => this.changed("active-init-title"));
	}

	is_full(length: number) {
		return Array.from({ length }, (_, id) => id + 1).every(id => this.workspaces.map(ws => ws.id).includes(id));
	}

	changeWorkspace(ws: number | string) {
		if (ws === this.active.workspace.id)
			this.messageAsync(`dispatch swapactiveworkspaces ${this.monitors[0].name} ${this.monitors[1].name}`);
		else this.messageAsync(`dispatch workspace ${ws}`);
	}

	#getMonitorID(name: string) {
		return this.monitors.find(Monitor => Monitor.name === name)?.id;
	}

	#createWindows(windows: (fixed | floating)[], id?: number | string) {
		return windows.flatMap(window =>
			window.length
				? this.monitors
						.filter(monitor => id === "all" || monitor.id === id)
						.map(monitor => window(monitor.id).on("destroy", (self: AgsWindow) => App.removeWindow(self)))
				: window().on("delete-event", (self: AgsWindow) => (self.hide(), true)),
		);
	}

	#recreateWindows(windows: fixed[], id?: number) {
		App.windows.forEach(window => {
			if (id !== undefined && window["monitor"] === id) App.removeWindow(window);
		});

		App.config({ windows: this.#createWindows(windows, id) });
	}

	initialWindows(windows: (fixed | floating)[]) {
		const fixedWindows = windows.filter(window => window.length);
		this.connect("monitor-removed", (_, name) => this.#recreateWindows(fixedWindows, this.#getMonitorID(name)));
		this.connect("monitor-added", (_, name) => this.#recreateWindows(fixedWindows, this.#getMonitorID(name)));

		return this.#createWindows(windows, "all");
	}
})();
