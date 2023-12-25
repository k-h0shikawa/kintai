// ContentView.swift
import SwiftUI

struct ContentView: View {
    
    let gateway = DailyAttendanceEntryGateway()
    let useCase: DailyAttendanceEntryUseCaseProtocol
    
    let projectGateway = ProjectGateway()
    let projectUseCase : ProjectUseCaseProtocol
    
    @State private var entryView = true

    @ObservedObject var viewModel: DailyAttendanceEntryViewModel
    
    init(){
        useCase = DailyAttendanceEntryUseCase(gateway: gateway)
        projectUseCase = ProjectUseCase(gateway: projectGateway)
        
        viewModel = DailyAttendanceEntryViewModel(
            useCase: useCase,
            gateway: gateway,
            projectUseCase: projectUseCase,
            projectGateway: projectGateway
        )
    }
    
    var body: some View {
        VStack{
            if entryView {
                DailyAttendanceEntryView()
            }else{
                ProjectView()
            }
            Button("画面切り替え"){
                entryView.toggle()
            }
        }
         
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

