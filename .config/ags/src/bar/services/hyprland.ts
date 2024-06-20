import { Hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";

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

	changeWorkspace(ws: number | string) {
		this.messageAsync(`dispatch workspace ${ws}`);
	}

	createNewWorkspace() {
		this.messageAsync("dispatch workspace emptym");
	}
})();
