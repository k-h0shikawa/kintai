import Foundation
// TimeSlot.swift
import SwiftUI

struct TimeSlot: Identifiable {
    let id = UUID()
    var hour: Int
    var minute: Int
    var projectName = ""
    var workDetails = ""
    var workMemo = ""
}
