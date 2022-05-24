import SwiftUI

struct ProgressBar: View {
    @EnvironmentObject var appController: AppController

var body: some View {
    HStack(alignment: .center) {
        ZStack{
            GeometryReader {geo in
                Rectangle()
                    .frame(width: geo.size.width, height: 8)
                    .foregroundColor(.grayColor2)
                    .cornerRadius(10)
                Rectangle()
                    .frame(width: geo.size.width*appController.progressBar, height: 8)
                    .foregroundColor(.orange)
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 10)
        }
    }
}
    
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
            .environmentObject(AppController())
    }
}
