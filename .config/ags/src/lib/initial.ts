import files from "@lib/files";

const config = JSON.parse(Utils.readFile(`${App.configDir}/src/default.json`));
const setConfig = async (file?: string) => {
	const path = files.fallback([file, `${App.configDir}/config.json`]);
	if (path) Object.assign(config, JSON.parse(Utils.readFile(path)));
};

const setScss = (directory: string, entry: string) => {
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
};

export default { config, setConfig, setScss };
