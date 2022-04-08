//
//  ContentView.swift
//  how about your waterfall
// 한강물 수온 체크 어플
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
                        VStack{
                            Image(systemName: "drop")
                                .resizable()
                                .frame(maxWidth: 200, maxHeight: 200)
                            Text("온도 : 19")
                                .padding()
            
                        }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
