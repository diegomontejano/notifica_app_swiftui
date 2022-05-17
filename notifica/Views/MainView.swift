import SwiftUI

struct MainView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor.grayColor1 // background
        UITabBar.appearance().unselectedItemTintColor = UIColor.grayColor3 // unselected
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir", size: 15)! ], for: .normal) // font
    }
    
    var body: some View {
        TabView{
            PontoView()
                .tabItem{
                    VStack{
                        Image(systemName: "clock")
                        Text("Ponto")
                    }
                }
                .tag(0)
            PickerView()
                .tabItem{
                    VStack{
                        Image(systemName: "person.3")
                        Text("Devs")
                    }
                }
                .tag(1)
        }
        .accentColor(.orange) // accent
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppController())
    }
}
