export default Variable(
	{ hour: -1, minute: -1, month: -1, day: -1 },
	{
		poll: [
			1000,
			'date "+%H %M %-m %-d"',
			time => {
				let times = time.split(" ").map(value => Number(value));
				return { hour: times[0], minute: times[1], month: times[2], day: times[3] };
			},
		],
	},
);
