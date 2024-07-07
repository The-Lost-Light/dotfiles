import { Gtk, BaseProps } from "types";

const Image = Widget.subclass(imports.gi.Gtk.Image);
const GdkPixbuf = imports.gi.GdkPixbuf;

type ImageProps = BaseProps<Gtk.Image, Gtk.Image.ConstructorProperties>;

export default ({ path, width = -1, height = -1, preserve_ratio = true, ...rest }) =>
	Image({
		pixbuf: GdkPixbuf.Pixbuf.new_from_file_at_scale(path, width, height, preserve_ratio),
		...rest,
	} as ImageProps);
