import SwiftUI

struct NotificationBanner: ViewModifier {
    @Binding var mostrarBanner: Bool
    @Binding var notificarQuandoFaltar: Int
        
    func body(content: Content) -> some View {
        ZStack{
            content
            if mostrarBanner {
                // banner
                VStack {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("IU Conecta")
                                .fontWeight(.heavy)
                            Text("Seu horário terminará em \(String(notificarQuandoFaltar)) minutos!")
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
                            mostrarBanner = false
                        }
                    }
                }
                
                

            }
        }
    }
}

extension View {
    func notificationBanner(mostrarBanner: Binding<Bool>, notificarQuandoFaltar: Binding<Int>) -> some View {
        modifier(NotificationBanner(mostrarBanner: mostrarBanner, notificarQuandoFaltar: notificarQuandoFaltar))
    }
}



// test view
struct TestView: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        Text("Test View (click here)")
            .notificationBanner(mostrarBanner: $appController.mostrarBanner, notificarQuandoFaltar: $appController.notificarQuandoFaltar)
            .onTapGesture {
                appController.mostrarBanner = true
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
