import SwiftUI

struct NewGoupView: View {
    
    @Binding var groupName: String
    @State var show = false
    @State var show2 = false
    @Namespace var animation
    @FocusState var istyping
    
    var onSave: (TalkGroup) -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: show ? .topLeading : .center) {
                RoundedRectangle(cornerRadius: show ? 24 : 40)
                    .foregroundStyle(Color(.systemGray6))
                VStack {
                    if !show {
                        Text("New Tasks").bold()
                            .matchedGeometryEffect(id: "text", in: animation)
                    } else {
                        VStack {
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $groupName)
                                    .focused($istyping)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                if !istyping {
                                    Text("\(Image(systemName: "pencil"))Group Name")
                                        .foregroundStyle(.gray)
                                        .padding(.top, 8)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .matchedGeometryEffect(id: "text", in: animation)
                                }
                            }
                        }
                    }
                }
                .padding(15)
            }
            .frame(height: show ? 200 : 60)
            .clipped()
            .overlay(alignment: .topTrailing) {
                if show2 {
                    Image(systemName: "xmark")
                        .padding(10)
                        .background(Color(.systemGray4), in: Circle())
                        .padding(10)
                        .onTapGesture {
                            close()
                        }
                }
            }
            .onTapGesture {
                if !show {
                    open()
                }
            }
            Button(action: {
                let newGroup = TalkGroup(title: groupName)
                    onSave(newGroup)
                close()
            }, label: {
                Text("Save")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .clipShape(.capsule)
                    .padding(.vertical)
                    .opacity(show ? 1 : 0)
            })
            .tint(.primary)
            .disabled(groupName.isEmpty)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .offset(y: show ? 0 : 100)
        .padding()
    }
    
    func open() {
        withAnimation(.spring(duration: 0.5)) {
            show.toggle()
        }
        withAnimation(.spring(duration: show ? 0.5 : 0.2).delay(show ? 0.3 : 0)) {
            show2.toggle()
        }
    }
    
    func close() {
        groupName = ""
        istyping = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            open()
        }
    }
}

#Preview {
    NewGoupView(groupName: .constant(""), onSave: {_ in})
}
