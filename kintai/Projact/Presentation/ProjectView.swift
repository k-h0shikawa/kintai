import SwiftUI

struct ProjectView: View {
    
    
    @ObservedObject var viewModel: DailyAttendanceEntryViewModel
    let gateway = DailyAttendanceEntryGateway()
    let useCase: DailyAttendanceEntryUseCaseProtocol
    
    let projectGateway = ProjectGateway()
    let projectUseCase : ProjectUseCaseProtocol
    
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
        HStack {
            TextField("プロジェクト名を入力してください", text: $viewModel.projectName)
                .padding()
                .border(Color.gray, width: 0.5)

            Button(action: {
                viewModel.registorProject()
            }) {
                Text("追加")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
