import Foundation
import SwiftUI

class AppController: ObservableObject {
    // app controllers
    @Published var enableNotifications: Bool = true
    @Published var minutesPicker: Int = 5
    @Published var workloadPicker: Int = 8
    @Published var countdownTimer = 0.0

}
