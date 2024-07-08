import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import { AgsWidget, BaseProps } from "types/widgets/widget";
import Window from "types/widgets/window";

import Revealer from "types/widgets/revealer";

export { Gtk, BaseProps };
export type agsWidget = AgsWidget<unknown>;
export type agsWindow = Window<Gtk.Widget, unknown>;

export type revealer = Revealer<Gtk.Widget, unknown>;

import { Binding } from "types/service";
import { Variable } from "types/variable";

export type BindingVariable<AttrIn, AttrOut> = Binding<Variable<AttrIn>, any, AttrOut>;
