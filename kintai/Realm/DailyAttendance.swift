import Foundation
import RealmSwift

// 日毎の業務内容を格納するテーブル
class DailyAttendance: Object {
    // 各フィールドを定義します
    @objc dynamic var id = 0
    @objc dynamic var workDateTime = ""
    @objc dynamic var projectName = ""
    @objc dynamic var workDetails = ""
    @objc dynamic var workMemo = ""

    // 主キーを設定します
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // ID を increment して返す
    static func newID(realm: Realm) -> Int {
        if let dailyAttendance = realm.objects(DailyAttendance.self).sorted(byKeyPath: "id").last {
            return dailyAttendance.id + 1
        } else {
            return 1
        }
    }

    // increment された ID を持つ新規 DailyAttendance インスタンスを返す
    static func create(realm: Realm) -> DailyAttendance {
        let dailyAttendance: DailyAttendance = DailyAttendance()
        dailyAttendance.id = newID(realm: realm)
        return dailyAttendance
    }
}

