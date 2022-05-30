import SwiftUI

struct PontoView: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTabBar()
            VStack(alignment: .leading) {
                Text("ponto eletrônico")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                PointCard()
                Text("notifica")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                NotificationCard()
            }
            .padding(.horizontal, 20)
            Spacer()
        }
        .onAppear { self.appController.simulateTimer() }
        .notificationBanner()
    }
}

struct PontoView_Previews: PreviewProvider {
    static var previews: some View {
        PontoView()
            .environmentObject(AppController())
    }
}
