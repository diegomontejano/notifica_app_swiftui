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
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .cornerRadius(10)
                            .foregroundColor(.grayColor3)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("IU Conecta")
                                    .fontWeight(.bold)
                                Spacer()
                                Text("agora") 
                                    .fontWeight(.regular)
                                    .font(.system(size: 14))
                                    .foregroundColor(.grayColor4)
                            }
                            Text("Seu horário terminará em \(String(appController.notificarQuandoFaltar)) minutos")
                                .fontWeight(.bold)
                            Text("Evite telemetria, prepare-se para passar o ponto!")
                                .fontWeight(.regular)
                        }
                        .padding(.vertical, 10)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(20)
                    .opacity(0.9)
                    .shadow(radius: 5)
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
