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
        // necessary request user authorization for the app notifications (implemented on @main)
        let content = UNMutableNotificationContent()
        content.title = "IU Conecta"
        content.subtitle = "Seu horário terminará em \(String(notificarQuandoFaltar)) minutos"
        content.body = "Evite telemetria, prepare-se para passar o ponto!"
        content.badge = 1
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
