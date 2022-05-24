import Foundation
import SwiftUI

class AppController: ObservableObject {
    // notification card properties
    @Published var mostrarBanner: Bool = false
    @Published var habilitarNotificacoes: Bool = true
    @Published var notificarQuandoFaltar: Int = 5
    @Published var cargaHorariaDiaria: Int = 8
    
    // timer properties
    @Published var countdownTimer: Double = 100.0
    @Published var progressBar: Double = 0.0
    
    // runned on loading Pontoview()
    func simulateTimer(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if self.countdownTimer > 0.0 {
                self.countdownTimer -= 1.0
                self.progressBar += 0.01
            } else {
                self.mostrarBanner = true
                self.countdownTimer = 100.0
                self.progressBar = 0.0
            }
        
            self.simulateTimer()
        }
    }
    
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                withAnimation {
//                    mostrarBanner = false
//                }
//            }
//        }
    
    
    
}
