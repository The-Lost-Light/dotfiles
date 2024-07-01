export const executeIfExist =
	<T,>(callback: (value: T) => void) =>
	(value: T | undefined | null) =>
		value !== undefined && value !== null && callback(value);

export const capitalize = executeIfExist((string: string) => string.replace(/^[a-z]/i, letter => letter.toUpperCase()));
