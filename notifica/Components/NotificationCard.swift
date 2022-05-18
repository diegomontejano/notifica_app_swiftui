import SwiftUI

struct NotificationCard: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Toggle("Habilitar notificações", isOn:  $appController.enableNotifications)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            Divider()
            HStack {
                Text("Notificar quando faltar")
                Spacer()
                Picker("minutosPicker", selection: $appController.minutesPicker) {
                    Text("5 minutos").tag(5)
                    Text("10 minutos").tag(60)
                    Text("15 minutos").tag(15)
                    Text("30 minutos").tag(30)
                    Text("45 minutos").tag(45)
                    Text("60 minutos").tag(60)
                }
            }
            Divider()
            HStack {
                Text("Carga horária diária       ")
                Picker("cargaHoraria", selection: $appController.workloadPicker) {
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Divider()
            HStack {
                Text("Faltam " + String(appController.countdownTimer).replacingOccurrences(of: ".", with: ":") + " min")
                Spacer()
                HStack(spacing: 0) {
                    // countdown bar
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
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.grayColor1)
        .cornerRadius(10)
    }
}

struct NotificationCard_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCard()
            .environmentObject(AppController())
    }
}
