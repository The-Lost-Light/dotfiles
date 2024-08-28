import files from "@lib/files";

function deepMerge(target: Object, source: Object) {
	for (const key in source)
		if (source[key] instanceof Object && key in target) deepMerge(target[key], source[key]);
		else target[key] = source[key];
}

export async function setCustom(file?: string) {
	const path = files.fallback([file, `${App.configDir}/config.json`]);
	if (path) deepMerge(config, JSON.parse(Utils.readFile(path)));
	if (!config.scripts) config.scripts = App.configDir + "/scripts/";
}

export async function setScss(directory: string, entry: string) {
	const scss = `${App.configDir}/${directory}/${entry}`;
	const css = "/tmp/ags/style.css";

	const applyCss = () =>
		Utils.exec(
			`sass ${scss} ${css}`,
			() => (App.resetCss(), App.applyCss(css)),
			err => print(err),
		);

	applyCss();
	Utils.monitorFile(`${App.configDir}/${directory}`, applyCss);
}

const config = JSON.parse(Utils.readFile(`${App.configDir}/src/default.json`));
export default config;
