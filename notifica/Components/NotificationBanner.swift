import SwiftUI

struct NotificationBanner: ViewModifier {
    @EnvironmentObject var appController: AppController
        
    func body(content: Content) -> some View {
        ZStack{
            content
            if appController.showBanner {
                // notification banner
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("IU Conecta")
                                .fontWeight(.heavy)
                            Text("Seu horário terminará em \(String(appController.notificarQuandoFaltar)) minutos!")
                                .fontWeight(.medium)
                        }
                        .padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.orange)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            appController.showBanner = false
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
                appController.showBanner = true
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
