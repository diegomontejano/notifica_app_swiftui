import SwiftUI

struct PontoView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTabBar()
            VStack(alignment: .leading) {
                Text("Ponto eletrônico")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                NotificationCard()
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}

struct PontoView_Previews: PreviewProvider {
    static var previews: some View {
        PontoView()
            .environmentObject(AppController())
    }
}
