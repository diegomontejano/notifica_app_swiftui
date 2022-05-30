import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .center, spacing: 15) {
                    // profile image
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 45))
                    Spacer()
                    // share icon
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20, weight: .bold))
                    // search icon
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20, weight: .bold))
                    // alerts icon
                    Image(systemName: "bell.fill")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.horizontal, 10)
                HStack {
                    // view title
                    Text("ponto")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, minHeight: 115, maxHeight: 115, alignment: .bottom)
            .background(.orange)
            .foregroundColor(.white)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .environmentObject(AppController())
    }
}
