import SwiftUI

@main
struct notificaApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                // makes all child views access only this instance
                .environmentObject(AppController())
        }
    }
}
