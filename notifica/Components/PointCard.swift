import SwiftUI
 
struct PointCard: View {
    @State var pointOfTheDay: Bool = true
 
// MARK: - Body
    var body: some View {
        VStack() {
            VStack{
                HStack {
                    HStack {
                        //Picker("ponto do dia", selection: $pointOfTheDay) {
                            Text("ponto de ontem").bold()
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                
                                Divider()
                                    .padding(.vertical)
                                    .frame(width: 5, height: 20)
                        
                            Text("ponto de hoje").bold()
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                        //}
                        
                        //.pickerStyle(SegmentedPickerStyle())
                    }
                   // .padding(5)
                    .frame(minWidth: 0, maxWidth: 340, minHeight: 0, maxHeight: 28)
                    .border(.gray)
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
                
                
                        HStack{
                            Text(Image(systemName: "clock")) + Text("10:00 - entrada")
                            Text(Image(systemName: "clock")) + Text("12:30 - saída")
                    
                        }
                        .font(.system(size: 14))
                
                        Divider()
                            .frame(width: 230)
                
                        HStack{
                            Text(Image(systemName: "clock")) + Text("13:30 - entrada")
                            Text(Image(systemName: "clock")) + Text("18:00 - saída")
                            
                        }
                        .font(.system(size: 14))
                
                        Text("marcação de ponto").bold()
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                
                        HStack {
                            Text("*")
                          //  .padding(5)
                                .padding(.horizontal, 5)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14))
                            
//                            Spacer()
//                                    .frame(width: 5)
                            
                            Text("senha")
                           // .padding(5)
                                .padding(.horizontal, -162 )
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14))
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
                        //.padding(.horizontal, 10)
                        .background(Color.grayColor3)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.grayColor1)
        .cornerRadius(10)
    }
}
 
// MARK: - Simulator
struct PointCard_Previews: PreviewProvider {
   // @EnvironmentObject var appController: AppController
    static var previews: some View {
        PointCard()
            .environmentObject(AppController())
    }
}

