import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

import { MprisPlayer } from "types/service/mpris";

import { AgsWidget as AgsWidgets } from "types/widgets/widget";
import Window from "types/widgets/window";
import Box from "types/widgets/box";
import Revealer from "types/widgets/revealer";
import Stack from "types/widgets/stack";

export { Gtk, MprisPlayer };
export type AgsWidget = AgsWidgets<unknown>;
export type AgsWindow = Window<Gtk.Widget, unknown>;

export type AgsBox = Box<Gtk.Widget, unknown>;
export type AgsRevealer = Revealer<Gtk.Widget, unknown>;
export type AgsStack = Stack<{ [name: string]: Gtk.Widget }, unknown>;
