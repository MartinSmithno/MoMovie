import UIKit

enum Tab: Int, CaseIterable {
    case search = 0
    case like = 1
    case profile = 2
    
    var title: String {
        switch self {
        case .search: return "Search"
        case .like: return "Like"
        case .profile: return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .search: return "magnifyingglass"
        case .like: return "heart.fill"
        case .profile: return "person.crop.circle"
        }
    }
}
