//
//  DailyAttendanceEntryView.swift
//  kintai
//
//  Created by hoshikawa on 2023/12/24.
//

import Foundation
import SwiftUI

struct DailyAttendanceEntryView: View {
    let gateway = DailyAttendanceEntryGateway()
    let useCase: DailyAttendanceEntryUseCaseProtocol
    
    let projectGateway = ProjectGateway()
    let projectUseCase : ProjectUseCaseProtocol
    
    @ObservedObject var viewModel: DailyAttendanceEntryViewModel
    
    init(){
        useCase = DailyAttendanceEntryUseCase(gateway: gateway)
        projectUseCase = ProjectUseCase(gateway: projectGateway)
        
        viewModel = DailyAttendanceEntryViewModel(
            useCase: useCase,
            gateway: gateway,
            projectUseCase: projectUseCase,
            projectGateway: projectGateway
        )
    }
    
    @State private var isShowingNewView = false
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Text("今日の日付： \(viewModel.currentDate, formatter: Self.dateFormatter)")
                    .font(.title)
                    .padding()
                HStack(spacing: 0) {
                    Text("勤務時間")
                        .frame(width: geometry.size.width / 4)
                    Text("案件名")
                        .frame(width: geometry.size.width / 4)
                    Text("対応内容")
                        .frame(width: geometry.size.width / 4)
                    Text("対応メモ")
                        .frame(width: geometry.size.width / 4)
                }
                ForEach(viewModel.timeSlots.indices, id: \.self) { index in
                    HStack(spacing: 0) {
                        Text("\(viewModel.timeSlots[index].hour):\(viewModel.timeSlots[index].minute == 0 ? "00" : "30")")
                            .frame(width: geometry.size.width / 4)
                        TextField("案件名", text: $viewModel.timeSlots[index].projectName)
                            .frame(width: geometry.size.width / 4)
                        TextField("対応内容", text: $viewModel.timeSlots[index].workDetails)
                            .frame(width: geometry.size.width / 4)
                        TextField("対応メモ", text: $viewModel.timeSlots[index].workMemo)
                            .frame(width: geometry.size.width / 4)
                    }
                }
                HStack {
                    Button(action: {
                        viewModel.addTimeSlot()
                    }) {
                        Text("＋")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        viewModel.removeTimeSlot()
                    }) {
                        Text("－")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 50)
            }
            HStack{
                Button {
                    viewModel.RecordJobDescription()
                } label: {
                    Text("登録")
                }
            }

        }
    }
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }
}

