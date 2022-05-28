import SwiftUI

struct SplashScreen: View {
    @State var animationBoolValue: [Bool] = Array(repeating: false, count: 5)
    
    var body: some View {
        ZStack {
            // SplashScreen()
            if !animationBoolValue[4] {
                ZStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(40)
                        // logo opacity effect [0]
                        .opacity(animationBoolValue[0] ? 1 : 0)
                        // logo scale effect [1]
                        .scaleEffect(animationBoolValue[1] ? 1 : 0, anchor: .center)
                        
                    // show notifica [2]
                    if animationBoolValue[2] == true {
                        Image("notifica")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(119)
                            // move notifica [3]
                            .offset(x: animationBoolValue[3] ? 41 : -80, y: 56)
                    }
                }
                // remove SplashScreen() [4]
                .opacity(animationBoolValue[4] ? 0 : 1)
            }
            // HomeView()
            GeometryReader {geo in
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    // show HomeView() from bottom [4]
                    .offset(y: animationBoolValue[4] ? 0 : (geo.size.height + 50))
            }
        }
        .onAppear {
            // logo opacity effect [0]
            withAnimation(.easeInOut(duration: 2.5)){
                animationBoolValue[0] = true
            }
            // logo scale effect [1]
            withAnimation(.easeInOut(duration: 2.5)){
                animationBoolValue[1] = true
            }
            // then, show notifica [2]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                animationBoolValue[2] = true
                // move notifica [3]
                withAnimation(.easeInOut(duration: 1.5).delay(1.5)){
                    animationBoolValue[3] = true
                }
                // then, remove SplashScreen() and show HomeView() from bottom [4]
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation(.easeInOut(duration: 0.5).delay(3.0)){
                        animationBoolValue[4] = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .environmentObject(AppController())
    }
}
