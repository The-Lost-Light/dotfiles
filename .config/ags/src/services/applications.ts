import { Applications } from "resource:///com/github/Aylur/ags/service/applications.js";

export default new (class ApplicationExtends extends Applications {
	static {
		Service.register(this, {}, {});
	}

	constructor() {
		super();
	}

	getEntry(wmclass: string) {
		return this.query(wmclass).find(
			entry =>
				entry.wm_class === wmclass ||
				entry.desktop?.toLowerCase() === `${wmclass.toLowerCase()}.desktop` ||
				entry.name.toLowerCase() === wmclass.toLowerCase(),
		);
	}
})();
