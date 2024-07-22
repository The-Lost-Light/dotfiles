export default function (time: number) {
	const minutes = Math.floor(time / 60);
	const seconds = Math.floor(time % 60);
	if (seconds >= 10) {
		return `${minutes}:${seconds}`;
	} else return `${minutes}:0${seconds}`;
}
