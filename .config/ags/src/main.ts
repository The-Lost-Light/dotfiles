const initial = (await import("@lib/initial")).default;
await initial.setConfig();

const Hyprland = (await import("@services/hyprland")).default;
const Bar = (await import("@bar/bar")).default;
const Corner = (await import("corner")).default;
const Osd = (await import("@osd/osd")).default;

export default App.config({
	windows: Hyprland.initialWindows([Bar, Corner, ...Osd]),
	onConfigParsed: () => initial.setScss("src/style", "style.scss"),
});
