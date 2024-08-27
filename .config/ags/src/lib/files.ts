const Gio = imports.gi.Gio;

function isExist(path: string | undefined) {
	return path ? Gio.File.new_for_path(path).query_exists(null) : undefined;
}

function fallback(paths: (string | undefined)[]) {
	return paths.find(path => isExist(path));
}

export default { isExist, fallback };
