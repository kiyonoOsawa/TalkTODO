import SwiftUI

struct ContentView: View {
    
    @State var groupName = ""
    @State private var groups: [TalkGroup] = [
        TalkGroup(title: "aaaaa"),
        TalkGroup(title: "bbbbb")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    ForEach(groups.indices, id:\.self) { index in
                        GroupListRow(group: $groups[index])
                    }
                }
                .scrollIndicators(.hidden)
                NewGoupView(groupName: $groupName) { newGroup in
                    groups.append(newGroup)
                }
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    ContentView()
}
