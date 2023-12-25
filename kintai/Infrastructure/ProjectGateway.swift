
import Foundation
import RealmSwift

struct ProjectGateway : ProjectGatewayProtocol{
    func registorProject(projectName: String){
        let config = Realm.Configuration(schemaVersion: 2)
        Realm.Configuration.defaultConfiguration = config
        let realm: Realm = try! Realm()
        try! realm.write({
            let project = Project.create(realm: realm)
            
            project.projectName = projectName
            project.statusType = 1
            realm.add(project)
        })
    }
}
