//
//  ChatView.swift
//  how about your waterfall
//
//  Created by calmkeen on 2022/04/08.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject  var chatlog: chatViewModel
    //추후 값을 받을때 사용
    @State var chat : String = ""
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(0..<4) { index in
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(alignment: .center) {
                                Spacer()
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        })
                        
                    }
                    Spacer()
                    Text("아래는 채팅창")
                    HStack(alignment: .bottom, spacing: 10){
                        TextField("실시간 한강근처 상황을 전해주세요",text: $chat)
                            .frame(maxWidth: 300, maxHeight: 50)
                            .shadow(radius: 10)
                            .padding()
                            .background(Color.white)
                        
                        Button {
                            
                        } label: {
                            Text("버튼")
                        }
                    }
                    
                    
                }.navigationTitle("채팅방")
            }
            
        }
        
        .edgesIgnoringSafeArea(.all)
    }
    
}





struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(chatViewModel())
    }
}
