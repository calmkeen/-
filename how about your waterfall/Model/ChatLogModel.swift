//
//  ChatLogModel.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/08.
//

import Foundation
import SwiftUI

class ChatLog : Identifiable{
    var id = UUID()
    var context :String
    
    init(id: UUID = UUID(), context: String){
        self.id = id
        self.context = context
    }
}

