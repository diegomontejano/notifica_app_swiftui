import Foundation
import SwiftUI

class AppController: ObservableObject {
    @Published var showNotificationBanner: Bool = false
    @Published var enableNotificationBanner: Bool = true
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
        }
    }
}
