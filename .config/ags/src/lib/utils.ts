// import GLib from ;
const Glib = imports.gi.GLib;

const executeIfExist =
	<T,>(callback: (value: T) => void) =>
	(value: T | undefined | null) =>
		value !== undefined && value !== null && callback(value);

export const capitalize = executeIfExist((string: string) => string.replace(/^[a-z]/i, letter => letter.toUpperCase()));

export const autoTimeout = (() => {
	let id: number | undefined;

	return (delay: number, callback: () => void) => {
		if (id) Glib.source_remove(id);

		id = Utils.timeout(delay * 1000, () => {
			callback();
			id = undefined;
		});
	};
})();
