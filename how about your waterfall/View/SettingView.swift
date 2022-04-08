//
//  SettingView.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            Text("info: 제작자 나")
            Text("문의 : iyunseong159@gmail")
            Text("version : 1.0")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
