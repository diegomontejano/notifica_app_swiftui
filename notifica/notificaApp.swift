import SwiftUI

@main
struct notificaApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                // makes all child views access only this instance
                .environmentObject(AppController())
        }
    }
}
