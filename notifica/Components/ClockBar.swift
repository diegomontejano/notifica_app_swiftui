import SwiftUI

struct ClockBar: View {
    var valorEntrada: String
    var valorSaida: String
    
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "clock")
                .background(Color.green)
            Text("\(valorEntrada) - entrada")
            Spacer()
            Image(systemName: "clock")
                .background(Color.green)
            Text("\(valorSaida) - saída")
            Spacer()
        }
        .font(.system(size: 14))
    }
}

struct ClockBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            ClockBar(valorEntrada: "000", valorSaida: "000")
        }
    }
}
