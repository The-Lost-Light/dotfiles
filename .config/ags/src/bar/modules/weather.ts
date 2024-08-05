import Weather from "@services/weather";

export default () => Widget.Label({ className: "weather", label: Weather.bind("symbol") });
