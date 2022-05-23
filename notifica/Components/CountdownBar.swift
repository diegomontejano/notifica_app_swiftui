import SwiftUI

struct CountdownBar: View {
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @State private var progressBar: Double = 0.0
    @EnvironmentObject var appController: AppController

var body: some View {
    HStack(alignment: .center) {
        ZStack{
            GeometryReader {geo in
                Rectangle()
                    .frame(width: geo.size.width, height: 8)
                    .foregroundColor(.grayColor2)
                    .cornerRadius(10)
                Rectangle()
                    .frame(width: geo.size.width*progressBar, height: 8)
                    .foregroundColor(.orange)
                    .cornerRadius(10)
                    .onReceive(timer) { _ in // start animation
                        if appController.countdownTimer > 0.0 {
                            appController.countdownTimer -= 1.0
                            progressBar += 0.01
                        } else {
                            appController.showNotificationBanner = true
                            appController.countdownTimer = 100.0
                            progressBar = 0.0
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 10)
        }
    }
}
    
struct CountdownBar_Previews: PreviewProvider {
    static var previews: some View {
        CountdownBar()
            .environmentObject(AppController())
    }
}
