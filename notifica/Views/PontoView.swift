import SwiftUI

struct PontoView: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: TabBar
            CustomTabBar()
            
            // MARK: Body
            VStack(alignment: .leading){
                Text("Ponto eletrônico")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                
                // MARK: Card
                HStack{
                    Toggle("Habilitar notificações", isOn:  $appController.enableNotifications)
                        .toggleStyle(SwitchToggleStyle(tint: .orange))
                }
                HStack {
                    Text("Notificar quando faltar")
                    Spacer()
                    Picker("minutosPicker", selection: $appController.minutesPicker) {
                        Text("5 minutos").tag(5)
                        Text("15 minutos").tag(15)
                        Text("30 minutos").tag(30)
                        Text("45 minutos").tag(45)
                        Text("60 minutos").tag(60)
                    }
                }
                HStack {
                    Text("Carga horária diária       ")
                    Picker("cargaHoraria", selection: $appController.workloadPicker) {
                        Text("4").tag(4)
                        Text("5").tag(5)
                        Text("6").tag(6)
                        Text("7").tag(7)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                HStack {
                    Text("Faltam " + String(appController.countdownTimer).replacingOccurrences(of: ".", with: ":") + " min")
                    Spacer()
                    HStack(spacing: 0) {
                        Rectangle()
                            .frame(maxHeight: 8)
                            .foregroundColor(.orange)
                            .cornerRadius(10)
                            .offset(x: +10)
                        Rectangle()
                            .frame(maxWidth: 40, maxHeight: 8)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                }
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
