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
        
        ScrollView {
            
            VStack {
                ForEach(0..<4) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 300, height: 50)
                                .shadow(radius: 10)
                                .padding()
                        }
                    })
                }
                Text("아래는 채팅창")
                    HStack{
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
                    
                
            }
        }
            //            VStack {
            //                List{
            //                    ForEach(chatlog.ChatData) {
            //                        Text($0.context)
            //                        //$표시 필수
            //                            .font(.title)
            //                    }
            //                }

            //            } //VStack
            //        }
        }
    }
    
    
    
    struct ChatView_Previews: PreviewProvider {
        static var previews: some View {
            ChatView()
                .environmentObject(chatViewModel())
        }
    }
