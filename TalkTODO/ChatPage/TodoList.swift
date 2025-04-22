//
//  TodoList.swift
//  TalkTODO
//
//  Created by 大澤清乃 on 2025/02/12.
//

import SwiftUI

struct TodoList: View {
    @Binding var todo: Todo
    
    var body: some View {
        HStack {
            Button(action: {
                todo.isCompleted.toggle()
            }, label: {
                Image(systemName: todo.isCompleted ? "circle.inset.filled" : "circle")
                    .foregroundColor(.white)
                    .font(.custom("Inter", size: 20))
            })
//            Spacer(minLength: 8)
            Text(todo.todoTitle)
                .foregroundColor(.white)
                .font(.custom("Inter", size: 20))
            Spacer()
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

#Preview {
//    TodoList(todo: Todo)
    ChatView(group: TalkGroup(title: "Sample Group"))
}
