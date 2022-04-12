//
//  ContentView.swift
//  how about your waterfall
// 한강물 수온 체크 어플
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var requestAPI = RequestAPI.apicall
    //var waterTemp: API
    var body: some View {
        
        NavigationView{
            List{
            ForEach(requestAPI.info, id: \.self) { result in
                Text(result.W_TEMP)
            }
            }
            VStack{
                Image(systemName: "drop")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()
                List{
                    Text("a")
                    ForEach(requestAPI.info, id: \.self) { result in
                        Text(result.W_TEMP)
                    }
                }
            }
        }.onAppear {
            requestAPI.loadData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
