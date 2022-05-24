import SwiftUI

struct TeamView: View {
    var body: some View {
        VStack(alignment: .center) {
            CustomTabBar()
            Spacer()
            Text("Team view")
            Spacer()
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
            .environmentObject(AppController())
    }
}
