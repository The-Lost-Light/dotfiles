import Weather from "@services/weather";

export default () => Widget.Label({ label: Weather.bind("symbol") });
