//
//  GroupSquare.swift
//  TalkTODO
//
//  Created by 大澤清乃 on 2025/02/10.
//

import SwiftUI

struct GroupListRow: View {
    @Binding var group: TalkGroup
    
    var body: some View {
        NavigationLink(destination: ChatView(group: group)) {
            HStack {
                Text(group.title)
                    .padding()
                Spacer()
            }
            .padding(.horizontal)
            .background(Color(.systemGray5))
            .clipShape(.rect(cornerRadius: 10))
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
