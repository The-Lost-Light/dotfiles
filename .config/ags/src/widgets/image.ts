const GdkPixbuf = imports.gi.GdkPixbuf;

import files from "@lib/files";

export default ({ path, width = -1, height = -1 }) => {
	if (!files.isExist(path)) return "";

	const pixbuf = GdkPixbuf.Pixbuf.new_from_file(path);
	return `
		background-image: url("${path}");
		background-size: cover;
		min-width: ${width === -1 && height !== -1 ? (pixbuf.get_width() * height) / pixbuf.get_height() : width}px;
		min-height: ${height === -1 && width !== -1 ? (pixbuf.get_height() * width) / pixbuf.get_width() : height}px;
	`;
};
