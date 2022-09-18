import Foundation

enum ListSection {
    case storiesPeople([ListItem])
    case popularMovies([ListItem])
    case popularTV([ListItem])
    case trendingToday([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .storiesPeople(let items),
                .popularMovies(let items),
                .popularTV(let items),
                .trendingToday(let items):
            return items
        }
    }
    
    var title: String {
        switch self {
        case .storiesPeople:
            return "Stories"
        case .popularMovies:
            return "Popular Movies"
        case .popularTV:
            return "Popular TV Shows"
        case .trendingToday:
            return "Trending Today"
        }
    }
}
