import SwiftUI

struct ChatView: View {
    
    @State private var isCompleting: Bool = false
    @State private var text: String = ""
    @State private var chat: [ChatMessage] = [
        ChatMessage(message: "あいうえお", role: .system),
        ChatMessage(message: "かきくけこ", role: .user)
    ]
    @State private var menus: [MenuItem] = [
        MenuItem(title: "Task"),
        MenuItem(title: "Remind"),
        MenuItem(title: "Hint")
    ]
    @State private var todos: [Todo] = []
    @Environment(\.presentationMode) var presentationMode

    var group: TalkGroup
    
    var body: some View {
        ZStack {
            Color(Color.blackColor)
                .ignoresSafeArea()
            VStack {
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(chat.indices, id: \.self) { index in
                                // 最初のメッセージ以外を表示
                                if index > 1 {
                                    ChattingView(message: chat[index])
                                }
                            }
                        }
                    }
                    .padding(.top)
                    // 画面をタップしたときにキーボードを閉じる
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    VStack {
                        ForEach(menus.indices, id:\.self) { index in
                            FlowButton(menu: menus[index])
                                .position(x: ScreenSize.width - 80, y: 40)
                                .frame(height: 80)
                        }
                    }
                }
                Spacer()
                ChatBox(isCompleting: $isCompleting, text: $text, sendAction: {
                    isCompleting = true
                    chat.append(ChatMessage(message: text, role: .user))
                    text = ""
                })
            }
            .navigationTitle(group.title)
            .toolbarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left") // アイコン
                            .font(.caption)
                    }
                    .foregroundColor(Color.blackTextColor)
                    .frame(width: 40, height: 40)
                    .background(Color(.white))
                    .clipShape(.capsule)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    ChatView(group: TalkGroup(title: "Sample Group"))
}
