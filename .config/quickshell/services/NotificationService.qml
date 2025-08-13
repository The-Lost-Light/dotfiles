pragma Singleton
import Quickshell
import Quickshell.Services.Notifications

Singleton {
	id: root
	NotificationServer {
		onNotification: notification => {}
	}
}
