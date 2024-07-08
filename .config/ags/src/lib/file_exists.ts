const Gio = imports.gi.Gio;

export default function (path: string) {
	return path ? Gio.File.new_for_path(path).query_exists(null) : undefined;
}
