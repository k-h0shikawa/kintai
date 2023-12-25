import Foundation

import SwiftUI
import Combine

class DailyAttendanceEntryViewModel: ObservableObject {
    // @Publishedを使用してViewの変更を監視
    @Published var timeSlots: [TimeSlot] = (9..<20).flatMap { hour in
        [TimeSlot(hour: hour, minute: 0), TimeSlot(hour: hour, minute: 30)]
    }
    @Published var currentDate = Date()
    // @Published var entry = true;
    @Published var entry = true;
    
    @Published var projectName = ""
    
    private let useCase : DailyAttendanceEntryUseCaseProtocol
    private let gateway : DailyAttendanceEntryGatewayProtocol
    
    private let projectUseCase : ProjectUseCaseProtocol
    private let projectGateway : ProjectGatewayProtocol
    
    init(useCase : DailyAttendanceEntryUseCaseProtocol,
         gateway : DailyAttendanceEntryGatewayProtocol,
         projectUseCase : ProjectUseCaseProtocol,
         projectGateway : ProjectGatewayProtocol
    ){
        self.useCase = useCase
        self.gateway = gateway
        self.projectUseCase = projectUseCase
        self.projectGateway = projectGateway
    }
    

    func addTimeSlot() {
        let lastSlot = timeSlots.last!
        let nextHour = lastSlot.minute == 0 ? lastSlot.hour : lastSlot.hour + 1
        let nextMinute = lastSlot.minute == 0 ? 30 : 0
        timeSlots.append(TimeSlot(hour: nextHour, minute: nextMinute))
    }

    func removeTimeSlot() {
        if !timeSlots.isEmpty {
            timeSlots.removeLast()
        }
    }
    
    
    func RecordJobDescription(){
        print(currentDate)
        let x = timeSlots
        useCase.RecordJobDescription(timeSlots: x, targetDate: currentDate)
    }
    
    func registorProject(){
        projectUseCase.registorProject(projectName: projectName)
    }
    
}
