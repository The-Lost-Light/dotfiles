export default Variable(
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
