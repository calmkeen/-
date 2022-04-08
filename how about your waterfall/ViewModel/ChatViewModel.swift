//
//  ChatViewModel.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/08.
//

import Foundation

class chatViewModel: ObservableObject{
    @Published var ChatData : [ChatLog]
    init() {
        ChatData = [
        ChatLog(context: "한강의 날씨 춥습니다."),
        ChatLog(context: "아뇨 안추운데"),
        ChatLog(context: "커플지옥"),
        ChatLog(context: "나도 커플임 쿠쿠")
    ]
    }
}
