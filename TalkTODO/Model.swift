import Foundation
import SwiftUI

struct TalkGroup: Identifiable {
    var title: String
    var id = UUID()
}

struct ChatMessage: Identifiable {
    enum RoleType: String {
        case system
        case user
    }
    
    var id = UUID()
    var message: String
    var role: RoleType = .system
}

struct MenuItem: Identifiable {
    var id = UUID()
    var title: String
}

struct Todo: Identifiable {
    var id = UUID()
    var todoTitle: String
    var todoDate: Date
    var todoTalkGroup: String
    var isCompleted: Bool
}
