import { Variable } from "types/variable";

import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

import { MprisPlayer } from "types/service/mpris";

import { AgsWidget as AgsWidgets } from "types/widgets/widget";
import Window from "types/widgets/window";
import Box from "types/widgets/box";
import Revealer from "types/widgets/revealer";
import Stack from "types/widgets/stack";

export { Variable as variable, Gtk, MprisPlayer };
export type AgsWidget = AgsWidgets<unknown>;
export type AgsWindow = Window<Gtk.Widget, unknown>;

export type AgsBox = Box<Gtk.Widget, unknown>;
export type AgsRevealer = Revealer<Gtk.Widget, unknown>;
export type AgsStack = Stack<{ [name: string]: Gtk.Widget }, unknown>;

export interface wttr {
	current_condition: {
		FeelsLikeC: string;
		FeelsLikeF: string;
		cloudcover: string;
		humidity: string;
		localObsDateTime: string;
		observation_time: string;
		precipInches: string;
		precipMM: string;
		pressure: string;
		pressureInches: string;
		temp_C: string;
		temp_F: string;
		uvIndex: string;
		visibility: string;
		visibilityMiles: string;
		weatherCode: string;
		weatherDesc: { value: string }[];
		weatherIconUrl: { value: string }[];
		winddir16Point: string;
		winddirDegree: string;
		windspeedKmph: string;
		windspeedMiles: string;
	}[];
	nearest_area: {
		areaName: { value: string }[];
		country: { value: string }[];
		latitude: string;
		longitude: string;
		population: string;
		region: { value: string }[];
		weatherUrl: { value: string }[];
	}[];
	request: {
		query: string;
		type: string;
	}[];
	weather: {
		astronomy: {
			moon_illumination: string;
			moon_phase: string;
			moonrise: string;
			moonset: string;
			sunrise: string;
			sunset: string;
		}[];
		avgtempC: string;
		avgtempF: string;
		date: string;
		hourly: {
			DewPointC: string;
			DewPointF: string;
			FeelsLikeC: string;
			FeelsLikeF: string;
			HeatIndexC: string;
			HeatIndexF: string;
			WindChillC: string;
			WindChillF: string;
			WindGustKmph: string;
			WindGustMiles: string;
			chanceoffog: string;
			chanceoffrost: string;
			chanceofhightemp: string;
			chanceofovercast: string;
			chanceofrain: string;
			chanceofremdry: string;
			chanceofsnow: string;
			chanceofsunshine: string;
			chanceofthunder: string;
			chanceofwindy: string;
			cloudcover: string;
			diffRad: string;
			humidity: string;
			precipInches: string;
			precipMM: string;
			pressure: string;
			pressureInches: string;
			shortRad: string;
			tempC: string;
			tempF: string;
			time: string;
			uvIndex: string;
			visibility: string;
			visibilityMiles: string;
			weatherCode: string;
			weatherDesc: {
				value: string;
			}[];
			weatherIconUrl: {
				value: string;
			}[];
			winddir16Point: string;
			winddirDegree: string;
			windspeedKmph: string;
			windspeedMiles: string;
		}[];
		maxtempC: string;
		maxtempF: string;
		mintempC: string;
		mintempF: string;
		sunHour: string;
		totalSnow_cm: string;
		uvIndex: string;
	}[];
}
