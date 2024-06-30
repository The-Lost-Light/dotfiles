export const executeIfExist = <T,>(value: T | null | undefined, callback: (value: T) => void) =>
	value !== null && value !== undefined && callback(value);

export const capitalize = (string: string | undefined) =>
	executeIfExist(string, string => string.replace(/^[a-z]/i, letter => letter.toUpperCase()));
