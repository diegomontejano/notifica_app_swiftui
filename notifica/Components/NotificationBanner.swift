import SwiftUI

struct NotificationBannerModifier: ViewModifier {
    let duration: TimeInterval = 3
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            content
            if show {
                // banner
                VStack {
                    HStack{
                        Image(systemName: "bell.badge")
                            .padding(.vertical)
                        Text("Lorem ipsum...")
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                    
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
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
