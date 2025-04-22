//
//  ChatBox.swift
//  TalkTODO
//
//  Created by 大澤清乃 on 2025/02/10.
//

import SwiftUI

struct ChatBox: View {
    
//    @State private var text: String = ""
    @FocusState var istyping
    @Namespace var animation
    @Binding var isCompleting: Bool
    @Binding var text: String
    
//    var chat: ChatMessage
    var sendAction: () -> Void
    
    var body: some View {
        ZStack{
            HStack{
                TextField("メッセージを入力", text: $text)
                    .foregroundStyle(Color(.white))
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray2))
                    .clipShape(.capsule)
                
                Button(action: sendAction) {
                    Image(systemName: "paperplane")
                        .foregroundStyle(Color.blackTextColor)
                        .frame(width: 55, height: 55)
                        .background(Color(.white))
                        .clipShape(.capsule)
                        .padding(.vertical)
                }
                .disabled(self.text == "" /*|| isCompleting == true*/)
            }
        }
        .background(Color(Color.blackColor))
        .padding()
    }
}

#Preview {
    ChatView(group: TalkGroup(title: "Sample Group"))
}
