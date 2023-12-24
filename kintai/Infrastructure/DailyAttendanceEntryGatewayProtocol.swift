import Foundation
protocol DailyAttendanceEntryGatewayProtocol{
    func RecordJobDescription(timeSlots: [TimeSlot], targetDate: Date)
}
