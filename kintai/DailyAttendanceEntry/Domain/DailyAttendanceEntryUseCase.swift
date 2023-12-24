
import Foundation

struct DailyAttendanceEntryUseCase: DailyAttendanceEntryUseCaseProtocol{
    
    
    private let gateway : DailyAttendanceEntryGatewayProtocol
    
    init(gateway : DailyAttendanceEntryGatewayProtocol){
        self.gateway = gateway
    }
    
    func RecordJobDescription(timeSlots: [TimeSlot], targetDate: Date){
        for timeSlot in timeSlots {
            print(timeSlot.projectName)
        }
        gateway.RecordJobDescription(timeSlots: timeSlots, targetDate: targetDate)

    }
}

