import Weather from "@services/weather";

Weather.setChecker({ interval: 1800, language: "zh-tw" });

export default () => Widget.Label({ className: "weather", label: Weather.bind("symbol") });
