import SwiftUI

struct PickerView: View {
    var moeda = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        VStack(spacing: 0){ // 1
            ScrollView{ // 12
                ForEach(moeda, id: \.self){ item in // 11 + array

                    HStack { // 3 (card creation)
                        Text(item) // 2 (text)
                            .padding() // 7 (text padding)
                       Spacer() // 6 (full screen)
                    }
                    .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150) // 4
                    .background(.orange) // 5
                    .cornerRadius(20) // 9
                    .shadow(radius: 20) // 10
                    .padding() // 8 (card padding)
                }
            }
        }
        
        
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
            .environmentObject(AppController())
    }
}
