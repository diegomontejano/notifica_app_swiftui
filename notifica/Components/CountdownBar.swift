import SwiftUI

struct CountdownBar: View {
    @State var progressTimer = 0.0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

var body: some View {
    VStack{
        Text("\(progressTimer*100)%")
        
        ZStack{
            GeometryReader {geo in
                Rectangle()
                    .frame(width: geo.size.width, height: 8)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                Rectangle()
                    .frame(width: geo.size.width*progressTimer, height: 8)
                    .foregroundColor(.orange)
                    .cornerRadius(10)
                    .onReceive(timer) { _ in // start the animation
                        if progressTimer < 1.0 {
                            progressTimer += 0.01
                        }
                    }
                }
            }
        }
        
        
    }
}
    
struct CountdownBar_Previews: PreviewProvider {
    static var previews: some View {
        CountdownBar()
            .environmentObject(AppController())
    }
}
