const Glib = imports.gi.GLib;

export default class {
	constructor() {
		this.#id = undefined;
	}

	#id: number | undefined;

	restart(delay: number, callback: () => void) {
		this.cancel();
		this.#id = Utils.timeout(delay * 1000, () => {
			this.#id = undefined;
			callback();
		});
	}

	cancel() {
		if (this.#id) Glib.source_remove(this.#id);
	}
}
