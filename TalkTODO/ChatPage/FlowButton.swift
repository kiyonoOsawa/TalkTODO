import SwiftUI

struct FlowButton: View {
    
    @State private var show = false
    @State private var show2 = false
    @Namespace var animation
    
//    @State private var todos: [Todo] = []
    
    var menu: MenuItem
    var count = "2"
    
//    var group: TalkGroup
    @State private var todos: [Todo] = [
        Todo(todoTitle: "あいうえお", todoDate: Date(), todoTalkGroup: "aaaa", isCompleted: false),
        Todo(todoTitle: "かきくけこ", todoDate: Date(), todoTalkGroup: "aaaa", isCompleted: false)
    ]
    
    var body: some View {
        ZStack {
            if !show2 {
                VStack {
                    Text(menu.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .onTapGesture {
                                show2 = true
                            }
                        Text(count)
                    }
                }
                .opacity(show ? 1 : 0)
            } else {
                VStack {
                    HStack() {
                        Spacer()
                        Image(systemName: "xmark")
                            .padding(10)
                            .background(.white, in: Circle())
                            .padding(10)
                            .onTapGesture {
//                                show = false
                                show2 = false
                            }
                    }
                    VStack {
                        ZStack(alignment: .top) {
                            ScrollView {
                                ForEach(todos.indices, id: \.self) { index in
                                    
                                    TodoList(todo: $todos[index])
                                        .padding(.bottom, 12)
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .frame(width: show2 ? ScreenSize.width - 80 : (show ? 80 : 20), height: show2 ? 200 : (show ? 80 : 80))
        .background(Color.blackTextColor)
        .opacity(show2 ? 1 : (show ? 1.0 : 0.6))
        .cornerRadius(show2 ? 20 : (show ? 20 : 8))
        .offset(x: show2 ? -(ScreenSize.width - 80)/3 : (80 - (show ? 60 : 30)), y: show2 ? 200/3 : 10)
        .matchedGeometryEffect(id: "shape", in: animation)
        .animation(.timingCurve(.circularEaseInOut, duration: 0.4), value: show)
        .animation(.spring(duration: 0.4), value: show2)
        .onTapGesture {
            show.toggle()
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 0 {
                        // 右に向かってスワイプ
                        show = false
                        show2 = false
                    } else {
                        // 左に向かってスワイプ
                        show = true
                        //                            show2 = true
                    }
                }
        )
        //        }
        .padding()
    }
}

#Preview {
    FlowButton(menu: MenuItem(title: "sample"))
}
