import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import Window from "types/widgets/window";
import { AgsWidget } from "types/widgets/widget";

import Revealer from "types/widgets/revealer";

export type gtkWidget = Gtk.Widget;
export type agsWidget = AgsWidget<unknown>;
export type agsWindow = Window<agsWidget, unknown>;

export type revealer = Revealer<gtkWidget, unknown>;
