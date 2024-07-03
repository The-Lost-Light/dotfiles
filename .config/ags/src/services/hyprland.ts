import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import Window from "types/widgets/window";

import { Hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";

type agsWindow = Window<Gtk.Widget, unknown>;
type fixed = (id?: number) => agsWindow;
type osd = () => agsWindow;

export default new (class HyprlandExtends extends Hyprland {
	static {
		Service.register(this, {}, { "active-init-title": ["string", "r"], "is-full": ["boolean", "r"] });
	}

	constructor() {
		super();

		this.connect("workspace-added", () => this.changed("is-full"));
		this.connect("workspace-removed", () => this.changed("is-full"));
		this.active.client.connect("changed", () => this.changed("active-init-title"));
	}

	get active_init_title() {
		return this.getClient(this.active.client.address)?.initialTitle ?? "";
	}

	get is_full() {
		return !Array.from({ length: 10 }, (_, id) => id + 1).every(id => this.workspaces.map(ws => ws.id).includes(id));
	}

	getMonitorID(name: string) {
		return this.monitors.find(Monitor => Monitor.name === name)?.id;
	}

	changeWorkspace(ws: number | string) {
		if (ws === this.active.workspace.id)
			this.messageAsync(`dispatch swapactiveworkspaces ${this.monitors[0].name} ${this.monitors[1].name}`);
		else this.messageAsync(`dispatch workspace ${ws}`);
	}

	createNewWorkspace() {
		this.messageAsync("dispatch workspace emptym");
	}

	#createWindows(windows: (fixed | osd)[], id?: number) {
		return windows.flatMap(window => {
			if (window.length)
				return this.monitors.flatMap(monitor => {
					if (id === -1 || monitor.id === id)
						return window(monitor.id).on("destroy", (self: agsWindow) => App.removeWindow(self));
					else return [];
				});
			else return window().on("delete-event", (self: agsWindow) => (self.hide(), true));
		});
	}

	#recreateWindows(windows: fixed[], id?: number) {
		App.windows.forEach(window => {
			if (id !== undefined && window["monitor"] === id) App.removeWindow(window);
		});

		App.config({ windows: this.#createWindows(windows, id) });
	}

	initialWindows(windows: (fixed | osd)[]) {
		const fixedWindows = windows.filter(window => window.length);
		this.connect("monitor-removed", (_, name) => this.#recreateWindows(fixedWindows, this.getMonitorID(name)));
		this.connect("monitor-added", (_, name) => this.#recreateWindows(fixedWindows, this.getMonitorID(name)));

		return this.#createWindows(windows, -1);
	}
})();
