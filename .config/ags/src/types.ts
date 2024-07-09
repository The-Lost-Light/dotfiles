import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import { AgsWidget as AgsWidgets, BaseProps } from "types/widgets/widget";
import Window from "types/widgets/window";

import Revealer from "types/widgets/revealer";
import Box from "types/widgets/box";

export { Gtk, BaseProps };
export type AgsWidget = AgsWidgets<unknown>;
export type AgsWindow = Window<Gtk.Widget, unknown>;

export type AgsBox = Box<Gtk.Widget, unknown>;
export type AgsRevealer = Revealer<Gtk.Widget, unknown>;
