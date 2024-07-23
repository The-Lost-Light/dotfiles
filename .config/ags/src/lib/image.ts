const GdkPixbuf = imports.gi.GdkPixbuf;

import fileExists from "@lib/file_exists";

export default ({ path, width = -1, height = -1 }) => {
	const file = fileExists(path) ? path : App.configDir + "/assets/loading.gif";
	const pixbuf = GdkPixbuf.Pixbuf.new_from_file(file);

	return `
	background-image: url("${file}");
	background-size: cover;
	min-width: ${width === -1 && height !== -1 ? (pixbuf.get_width() * height) / pixbuf.get_height() : width}px;
	min-height: ${height === -1 && width !== -1 ? (pixbuf.get_height() * width) / pixbuf.get_width() : height}px;
	`;
};
