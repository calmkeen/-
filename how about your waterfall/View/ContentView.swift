//
//  ContentView.swift
//  how about your waterfall
// 한강물 수온 체크 어플
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var requestAPI = RequestAPI.apicall
    //@EnvironmentObject private var requestAPIFunc: RequestAPI
    //var waterTemp: API
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Image(systemName: "drop")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()

                HStack{
                    Text("a")
                    ForEach(requestAPI.water, id: \.self){ result in
                            Text(result.MSR_TIME)
                            Text(result.SITE_ID)
                            Text(result.W_TEMP)
                        
                    }
                    Text("a")
                }
            }
        }
        .onAppear {
           // requestAPI.loadData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
