import SwiftUI

struct NotificationBanner: ViewModifier {
    @EnvironmentObject var appController: AppController
        
    func body(content: Content) -> some View {
        ZStack{
            content
            if appController.showNotificationBanner {
                // notification banner
                VStack {
                    HStack {
                        Spacer()
                        // app icon
                        Image("app-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            HStack {
                                // notification title
                                Text("IU Conecta")
                                    .fontWeight(.bold)
                                Spacer()
                                // notification time
                                Text("agora") 
                                    .fontWeight(.regular)
                                    .font(.system(size: 14))
                                    .foregroundColor(.grayColor4)
                            }
                            // notification subtitle
                            Text("Seu horário terminará em \(String(appController.notificarQuandoFaltar)) minutos")
                                .fontWeight(.bold)
                            // notification body
                            Text("Evite telemetria, prepare-se para passar o ponto!")
                                .fontWeight(.regular)
                        }
                        .padding(.vertical, 10)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .font(.system(size: 16))
                    .padding(8)
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        withAnimation {
                            appController.showNotificationBanner = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func notificationBanner() -> some View {
        modifier(NotificationBanner())
    }
}



// MARK: Test View
struct TestNotificationBanner: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        Text("Test Notification Banner (click here)")
            .notificationBanner()
            .onTapGesture {
                appController.showNotificationBanner = true
            }
    }
}

struct TestNotificationBanner_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            TestNotificationBanner()
                .environmentObject(AppController())
        }
    }
}
