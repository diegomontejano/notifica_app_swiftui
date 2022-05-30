import SwiftUI
 
struct PointCard: View {
    @State var pointOfTheDay: Bool = true
    
    var body: some View {
            VStack{
                HStack {
                    HStack {
                        Text("ponto de ontem")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                            Divider()
                        .foregroundColor(.black)
                    
                        Text("ponto de hoje").bold()
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                    .frame(minWidth: 0, maxWidth: 340, minHeight: 0, maxHeight: 28)
                    .background(.white)
                }
                .padding(8)
                .background(.white)
                .frame(maxWidth: .infinity)
                Text("ponto do dia").bold()
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18))
        
                Spacer()
                    .frame(height: 10)
        
                Text("horas trabalhadas:")
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14))
        
        
                VStack{
                    ClockBar(valorEntrada: "10:00", valorSaida: "12:30")
                    Divider()
                       // .frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
                    ClockBar(valorEntrada: "10:00", valorSaida: "12:30")
                }

                Text("marcação de ponto").bold()
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18))
        
                HStack {
                    Text("*")
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                    Text("senha")
                        .font(.system(size: 14))
                    Spacer()
                }
                HStack {
                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 25)
                        .background(.white)
                        .border(.gray)
                
                    Spacer()
                        .frame(width: 50)
                    Button("autenticar") {
                        print("autenticar")
                }
                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 30)
                .background(Color.grayColor3)
                .font(.system(size: 17))
                .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.grayColor1)
            .cornerRadius(10)
    }
}

struct PointCard_Previews: PreviewProvider {
    static var previews: some View {
        PointCard()
            .environmentObject(AppController())
    }
}

