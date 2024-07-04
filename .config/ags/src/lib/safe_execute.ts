export default function <T>(callback: (value: T) => void) {
	return (value: T | undefined | null) => value !== undefined && value !== null && callback(value);
}
