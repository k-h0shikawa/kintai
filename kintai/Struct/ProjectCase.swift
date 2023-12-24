//
//  Project.swift
//  kintai
//
//  Created by hoshikawa on 2023/12/24.
//

import Foundation
import SwiftUI

struct ProjectCase: Identifiable {
    let id = UUID()
    var projectName: String
    var statusType: Int
}
