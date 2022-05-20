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
                    Spacer()
                    
                    HStack{
                        Image(systemName: "bell.badge")
                            .padding(.vertical)
                        Text("Lorem ipsum...")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(.orange)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    .padding()
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
    @State var showNotificationBanner = false
    
    var body: some View {
        Text("Hello World!")
            .notificationBanner(show: $showNotificationBanner)
            .onTapGesture {
                showNotificationBanner = true
            }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(AppController())
    }
}
