import Foundation
import SwiftUI
import UserNotifications

class AppController: ObservableObject {
    @Published var showNotificationBanner: Bool = false
    @Published var enableNotificationBanner: Bool = false
    @Published var notificarQuandoFaltar: Int = 5
    @Published var cargaHorariaDiaria: Int = 240
    @Published var counter: Int = 0
    
    var counterToMinutes: String {
        let currentTime = cargaHorariaDiaria - counter
        let seconds = currentTime % 60
        let minutes = currentTime / 60
        return "\(minutes)h e \(seconds < 10 ? "0" : "")\(seconds)min"
    }
    
    var progressBar: Double {
        return (Double(counter) / Double(cargaHorariaDiaria))
    }
    
    // runned on load HomeView()
    func simulateTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if self.counter < self.cargaHorariaDiaria {
                self.counter += 1
                self.simulateNotificationBanner()
            } else {
                self.counter = 0
            }
            self.simulateTimer()
        }
    }
    
    func simulateNotificationBanner() {
        if self.enableNotificationBanner == true && counterToMinutes.contains("0h e \(String(notificarQuandoFaltar))min")
            || self.enableNotificationBanner == true && counterToMinutes == "0h e 05min" {
             self.showNotificationBanner = true
            self.realNotificationBanner()
        }
    }
    
    func realNotificationBanner() {
        // request user authorization for app notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
            if success {
                print("Notification allowed")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "IU Conecta"
        notificationContent.subtitle = "Seu horário terminará em \(String(notificarQuandoFaltar)) minutos"
        notificationContent.body = "Evite telemetria, prepare-se para passar o ponto!"
        notificationContent.badge = 1
        notificationContent.sound = UNNotificationSound.default

        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: notificationTrigger)

        UNUserNotificationCenter.current().add(notificationRequest)
    }
}
