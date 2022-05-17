import SwiftUI

struct ValidateTextField: View {
    @State var textFieldValue: String = ""
    
    var body: some View {
        TextField("00:00", text: $textFieldValue)
            .padding(.leading)
            .font(.system(size: 25))
            .frame(minHeight: 50)
            .background(Color.grayColor1)
            .cornerRadius(10)
            .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            .onChange(of: textFieldValue) {newValue in
                // insert/remove :
                if newValue.count > 1 && !newValue.contains(":") {
                  self.textFieldValue = String(newValue.prefix(2) + ":")
                }
                if newValue.count < 4 && newValue.contains(":") {
                    self.textFieldValue = String(newValue.dropLast())
                }
                // limit decimal count
                if newValue.count > 5 {
                    self.textFieldValue = String(newValue.prefix(5))
                }
            }
    }
}

struct ValidateTextField_Previews: PreviewProvider {
    static var previews: some View {
        ValidateTextField()
    }
}
