//
//  ProjectUseCase.swift
//  kintai
//
//  Created by hoshikawa on 2023/12/24.
//

import Foundation

struct ProjectUseCase: ProjectUseCaseProtocol{
    
    
    private let gateway : ProjectGatewayProtocol
    
    init(gateway : ProjectGatewayProtocol){
        self.gateway = gateway
    }
    
    func RecordProject(project: String, statusType: Int){
        
    }
}
