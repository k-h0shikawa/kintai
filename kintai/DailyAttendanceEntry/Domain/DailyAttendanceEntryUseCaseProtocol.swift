
import Foundation

protocol DailyAttendanceEntryUseCaseProtocol{
    func RecordJobDescription(timeSlots: [TimeSlot], targetDate: Date)
}
