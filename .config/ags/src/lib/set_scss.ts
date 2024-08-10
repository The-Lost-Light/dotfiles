export default (directory: string, entry: string) => {
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
