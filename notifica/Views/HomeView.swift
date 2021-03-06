import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appController: AppController
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.grayColor1 // background
        UITabBar.appearance().unselectedItemTintColor = UIColor.grayColor3 // unselected
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir", size: 15)! ], for: .normal) // font
    }
    
    var body: some View {
        TabView {
            PontoView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("Ponto")
                    }
                }
                .tag(0)
            TeamView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.3")
                        Text("Team")
                    }
                }
                .tag(1)
        }
        .accentColor(.orange) // accent
        .onAppear { self.appController.simulateTimer() }
        .notificationBanner()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppController())
    }
}
