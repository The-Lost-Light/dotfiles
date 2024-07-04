import safeExecute from "@lib/safe_execute";

export default safeExecute((string: string) => string.replace(/^[a-z]/i, letter => letter.toUpperCase()));
