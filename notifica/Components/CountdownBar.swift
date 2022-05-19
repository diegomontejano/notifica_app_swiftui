import SwiftUI

struct CountdownBar: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
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
                    .frame(width: geo.size.width*appController.countdownTimer, height: 8)
                    .foregroundColor(.orange)
                    .cornerRadius(10)
                    .onReceive(timer) { _ in // start animation
                        if appController.countdownTimer < 1.0 {
                            appController.countdownTimer += 0.01
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
