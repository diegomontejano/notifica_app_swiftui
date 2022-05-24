import Foundation
import SwiftUI

class AppController: ObservableObject {
    // properties of NotificationCard()
    @Published var showNotificationBanner: Bool = false
    @Published var habilitarNotificacoes: Bool = true
    @Published var notificarQuandoFaltar: Int = 5
    @Published var cargaHorariaDiaria: Int = 8
    @Published var countdownTimer: Double = 100.0
    @Published var progressBar: Double = 0.0

    // runned on load PontoView()
    func simulateTimer(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if self.countdownTimer > 0.0 {
                self.countdownTimer -= 1.0
                self.progressBar += 0.01
            } else {
                self.showNotificationBanner = true
                self.countdownTimer = 100.0
                self.progressBar = 0.0
            }
            self.simulateTimer()
        }
    }
}
