import Foundation
import RealmSwift

struct DailyAttendanceEntryGateway: DailyAttendanceEntryGatewayProtocol{
    
    func RecordJobDescription(timeSlots: [TimeSlot], targetDate: Date){
        let config = Realm.Configuration(schemaVersion: 2) // #1

        Realm.Configuration.defaultConfiguration = config // #2
        let realm: Realm = try! Realm()
        try! realm.write({
            for timeSlot in timeSlots {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                formatter.timeZone = TimeZone(identifier: "Asia/Tokyo") // タイムゾーンを日本時間に設定
                
                let dateString = formatter.string(from: targetDate)
                
                let dateTimeString = dateString + " " + String(format: "%02d", timeSlot.hour) + ":" + String(format: "%02d", timeSlot.minute)
                
                print("dateTimeString : " + dateTimeString)
                
                let dailyAttendance = DailyAttendance.create(realm: realm)
                dailyAttendance.workDateTime = dateTimeString
                dailyAttendance.workDetails = timeSlot.workDetails
                dailyAttendance.workMemo = timeSlot.workMemo
                
                realm.add(dailyAttendance)
                
            }
        })
        
    }
    
    
}
