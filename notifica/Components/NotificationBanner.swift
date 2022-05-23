import SwiftUI

struct NotificationBannerModifier: ViewModifier {
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            content
            if show {
                // banner
                VStack {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("IU Conecta")
                                .fontWeight(.heavy)
                            Text("Seu horário terminará em 5 minutos!")
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
                            show = false
                        }
                    }
                }
                
                

            }
        }
    }
}

extension View {
    func notificationBanner(show: Binding<Bool>) -> some View {
        modifier(NotificationBannerModifier(show: show))
    }
}



// test view
struct TestView: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        Text("Test View (click here)")
            .notificationBanner(show: $appController.showNotificationBanner)
            .onTapGesture {
                appController.showNotificationBanner = true
            }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            TestView()
                .environmentObject(AppController())
        }
    }
}
