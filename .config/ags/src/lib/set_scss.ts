export default ({ directory, entry }) => {
	const scss = `${App.configDir}/${directory}/${entry}`;
	const css = "/tmp/ags/style.css";

	const applyCss = () =>
		Utils.exec(
			`sassc ${scss} ${css}`,
			() => (App.resetCss(), App.applyCss(css)),
			err => print(err),
		);

	applyCss();
	Utils.monitorFile(directory, applyCss);
};
