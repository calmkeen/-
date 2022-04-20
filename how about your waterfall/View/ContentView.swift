//
//  ContentView.swift
//  how about your waterfall
// 한강물 수온 체크 어플
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct ContentView: View {
    
    
    
    //var waterTemp: API
    
    
    var body: some View {
        NavigationView{
            
            ZStack {
                Image("water2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                VStack{
                    Text("위치 확인용")
                    
                    VStack(alignment: .leading, spacing:  20){
                        Text("수온: 19")
                        HStack{
                            Text("위치")
                            Text("Seoul")
                        }
                        
                        Text("feels like : ???")
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    
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
        ContentView ()
    }
}
