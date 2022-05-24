import SwiftUI

struct NotificationCard: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack(spacing: 10){
            // toggle button
            HStack{
                Toggle("Habilitar notificações", isOn:  $appController.habilitarNotificacoes)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            Divider()
            // minutes picker
            HStack {
                Text("Notificar quando faltar")
                Spacer()
                Picker("minutosPicker", selection: $appController.notificarQuandoFaltar) {
                    Text("5 minutos").tag(5)
                    Text("10 minutos").tag(10)
                    Text("15 minutos").tag(15)
                    Text("30 minutos").tag(30)
                    Text("45 minutos").tag(45)
                    Text("60 minutos").tag(60)
                }
            }
            Divider()
            // workload picker
            HStack {
                Text("Carga horária diária    ")
                Picker("cargaHoraria", selection: $appController.cargaHorariaDiaria) {
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Divider()
            // countdown timer
            HStack(alignment: .center) {
                Text("Faltam " + String(format: "%.2f", appController.countdownTimer).replacingOccurrences(of: ".", with: ":") + " min           ")
                ProgressBar()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.grayColor1)
        .cornerRadius(10)
    }
}

struct NotificationCard_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCard()
            .previewDevice("iPhone 12")
            .environmentObject(AppController())
    }
}
