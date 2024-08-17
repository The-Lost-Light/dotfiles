import { variable } from "types";

const time = Variable(
	{ hour: "", minute: "", month: "", day: "" },
	{
		poll: [
			1000,
			'date "+%H %M %-m %-d"',
			time => {
				let times = time.split(" ").map(value => value);
				return { hour: times[0], minute: times[1], month: times[2], day: times[3] };
			},
		],
	},
);

type TimeExtend = variable<{
	hour: string;
	minute: string;
	month: string;
	day: string;
}> & { format: (time: number) => string };
time["format"] = function (time: number) {
	const left = Math.floor(time / 60);
	const right = Math.floor(time % 60);

	if (right >= 10) return `${left}:${right}`;
	else return `${left}:0${right}`;
};

export default time as TimeExtend;
