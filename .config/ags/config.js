const entry = App.configDir + "/src/main.ts";
const outdir = "/tmp/ags/js";

try {
  // prettier-ignore
  await Utils.execAsync([
      "bun", "build", entry,
      "--outdir", outdir,
      "--external", "resource://*",
      "--external", "gi://*",
  ])
  await import(`file://${outdir}/main.js`);
} catch (error) {
  console.error(error);
}
