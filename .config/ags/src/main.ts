import { setCustom, setScss } from "@lib/config";
await setCustom();

const [Hyprland, Bar, Osd] = await Promise.all([
	import("@services/hyprland").then(module => module.default),
	import("@bar/bar").then(module => module.default),
	import("@osd/osd").then(module => module.default),
]);

export default App.config({
	windows: Hyprland.initialWindows([Bar, ...Osd]),
	onConfigParsed: () => setScss("src/style", "style.scss"),
});
