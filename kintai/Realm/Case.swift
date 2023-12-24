import Foundation
import RealmSwift

// 案件の情報を格納するテーブル
class Project: Object {
    // 各フィールドを定義します
    @objc dynamic var id = 0
    @objc dynamic var projectName = ""
    @objc dynamic var statusType = 0

    // 主キーを設定します
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // ID を increment して返す
    static func newID(realm: Realm) -> Int {
        if let project = realm.objects(Project.self).sorted(byKeyPath: "id").last {
            return project.id + 1
        } else {
            return 1
        }
    }

    // increment された ID を持つ新規 Project インスタンスを返す
    static func create(realm: Realm) -> Project {
        let project: Project = Project()
        project.id = newID(realm: realm)
        return project
    }
}
