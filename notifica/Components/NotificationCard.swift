import SwiftUI

struct NotificationCard: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack(spacing: 10) {
            // habilitar notificações
            HStack {
                Toggle("Habilitar notificações", isOn:  $appController.enableNotificationBanner)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            Divider()
            // notificar quando faltar
            HStack {
                Text("Notificar quando faltar")
                Spacer()
                Picker("minutosPicker", selection: $appController.notificarQuandoFaltar) {
                    Text("5 minutos").tag(5)
                    Text("10 minutos").tag(10)
                    Text("15 minutos").tag(15)
                    Text("30 minutos").tag(30)
                }
            }
            Divider()
            // carga horária diária
            HStack {
                Text("Carga horária diária    ")
                Picker("cargaHoraria", selection: $appController.cargaHorariaDiaria) {
                    Text("4").tag(240)
                    Text("6").tag(360)
                    Text("8").tag(480)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Divider()
            // faltam 4h e 00min
            HStack(alignment: .center) {
                Text("Faltam \(appController.counterToMinutes)        ")
                // progress bar
                ZStack {
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: geo.size.width, height: 8)
                            .foregroundColor(.grayColor2)
                            .cornerRadius(10)
                        Rectangle()
                            .frame(width: geo.size.width*appController.progressBar, height: 8)
                            .foregroundColor(.orange)
                            .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 10)
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
