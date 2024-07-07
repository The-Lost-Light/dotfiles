export default function <T, R>(callback: (value: T) => R) {
	return (value: T | undefined | null) => value !== undefined && value !== null && callback(value);
}
