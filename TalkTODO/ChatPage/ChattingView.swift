//
//  ChattingView.swift
//  TalkTODO
//
//  Created by 大澤清乃 on 2025/02/11.
//

import SwiftUI

struct ChattingView: View {
    
    var message: ChatMessage
    
    var body: some View {
        HStack {
            if message.role.rawValue == "user" {
                Spacer()
            } else {
                // ユーザーでない場合はアバターを表示
                AvatarView(imageName: "avatar")
                    .padding(.trailing, 8)
            }
            VStack(alignment: .leading, spacing: 4) {
                // メッセージのテキストを表示
                Text(message.message)
                    .font(.system(size: 14)) // フォントサイズを調整
                    .foregroundColor(message.role.rawValue == "user" ? Color.blackTextColor : .black)
                    .padding(10)
                // ユーザーとAIのメッセージで背景色を変更
                    .background(message.role.rawValue == "user" ? Color(.white) : Color(#colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9176470588, alpha: 1)))
                    .cornerRadius(20) // 角を丸くする
            }
            .padding(.vertical, 5)
            // ユーザーのメッセージの場合は右側にスペースを追加
            if message.role.rawValue != "user" {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatView(group: TalkGroup(title: "Sample Group"))
}
