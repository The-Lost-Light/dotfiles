import time from "@lib/time";
import { wttr } from "types";

let WWO_CODE = {
	113: "Sunny",
	116: "PartlyCloudy",
	119: "Cloudy",
	122: "VeryCloudy",
	143: "Fog",
	176: "LightShowers",
	179: "LightSleetShowers",
	182: "LightSleet",
	185: "LightSleet",
	200: "ThunderyShowers",
	227: "LightSnow",
	230: "HeavySnow",
	248: "Fog",
	260: "Fog",
	263: "LightShowers",
	266: "LightRain",
	281: "LightSleet",
	284: "LightSleet",
	293: "LightRain",
	296: "LightRain",
	299: "HeavyShowers",
	302: "HeavyRain",
	305: "HeavyShowers",
	308: "HeavyRain",
	311: "LightSleet",
	314: "LightSleet",
	317: "LightSleet",
	320: "LightSnow",
	323: "LightSnowShowers",
	326: "LightSnowShowers",
	329: "HeavySnow",
	332: "HeavySnow",
	335: "HeavySnowShowers",
	338: "HeavySnow",
	350: "LightSleet",
	353: "LightShowers",
	356: "HeavyShowers",
	359: "HeavyRain",
	362: "LightSleetShowers",
	365: "LightSleetShowers",
	368: "LightSnowShowers",
	371: "HeavySnowShowers",
	374: "LightSleetShowers",
	377: "LightSleet",
	386: "ThunderyShowers",
	389: "ThunderyHeavyRain",
	392: "ThunderySnowShowers",
	395: "HeavySnowShowers",
};

let WEATHER_SYMBOL_WI_DAY = {
	Unknown: "?",
	Cloudy: "",
	Fog: "",
	HeavyRain: "",
	HeavyShowers: "",
	HeavySnow: "",
	HeavySnowShowers: "",
	LightRain: "",
	LightShowers: "",
	LightSleet: "",
	LightSleetShowers: "",
	LightSnow: "",
	LightSnowShowers: "",
	PartlyCloudy: "",
	Sunny: "",
	ThunderyHeavyRain: "",
	ThunderyShowers: "",
	ThunderySnowShowers: "",
	VeryCloudy: "",
};

let WEATHER_SYMBOL_WI_NIGHT = {
	Unknown: "?",
	Cloudy: "",
	Fog: "",
	HeavyRain: "",
	HeavyShowers: "",
	HeavySnow: "",
	HeavySnowShowers: "",
	LightRain: "",
	LightShowers: "",
	LightSleet: "",
	LightSleetShowers: "",
	LightSnow: "",
	LightSnowShowers: "",
	PartlyCloudy: "",
	Sunny: "",
	ThunderyHeavyRain: "",
	ThunderyShowers: "",
	ThunderySnowShowers: "",
	VeryCloudy: "",
};

export default new (class WeatherService extends Service {
	static {
		Service.register(
			this,
			{},
			{
				symbol: ["string", "r"],
			},
		);
	}

	constructor() {
		super();
	}

	#signal_id: number | undefined;
	#data = Variable({});
	#symbol = "";

	get symbol() {
		return this.#symbol;
	}

	#setSymbol(data: wttr) {
		let hourly = Math.floor(Number(time.value.hour) / 3);
		let code = WWO_CODE[data.weather[0].hourly[hourly].weatherCode];
		let sun = [data.weather[0].astronomy[0].sunrise, data.weather[0].astronomy[0].sunset]
			.map(time => time.split(/[: ]/))
			.map(time => {
				if (time[2] === "PM") return [Number(time[0]) + 12, Number(time[1])];
				else return [Number(time[0]), Number(time[1])];
			});

		let minutes = Number(time.value.hour) * 60 + Number(time.value.minute);
		if (sun[0][0] * 60 + sun[0][1] <= minutes && minutes <= sun[1][0] * 60 + sun[1][1]) {
			this.#symbol = WEATHER_SYMBOL_WI_DAY[code];
		} else {
			this.#symbol = WEATHER_SYMBOL_WI_NIGHT[code];
		}
	}

	setChecker({ interval = 600, language = "" }) {
		if (this.#data.is_polling) this.#data.stopPoll();
		if (this.#signal_id) this.#data.disconnect(this.#signal_id);
		this.#data = Variable(
			{},
			{
				poll: [
					interval * 1000,
					() =>
						Utils.fetch(`https://wttr.in/?format=j1${language !== "" ? "&lang" + language : ""}`)
							.then(data => data.json())
							.then(data => (this.#setSymbol(data), data)),
				],
			},
		);
		this.#signal_id = this.#data.connect("changed", () => {
			this.changed("symbol");
		});
	}
})();
