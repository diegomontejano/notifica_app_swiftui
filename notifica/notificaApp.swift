import SwiftUI
import UserNotifications

@main
struct notificaApp: App {
    // request user authorization for the app notifications
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
            if success {
                print("Notification allowed")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                // makes all child views access only this instance
                .environmentObject(AppController())
        }
    }
}
