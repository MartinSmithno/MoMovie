import UIKit

struct MockData {
    static let shared = MockData()
    
    private let storiesPeople: ListSection = {
        .storiesPeople([ListItem(title: "Tom Hardy", poster: "tom-hardy")])
    }()
    
    private let popularMovies: ListSection = {
        .popularMovies([ListItem(title: "Beast", poster: "beast-poster")])
    }()
    
    private let popularTV: ListSection = {
        .popularTV([ListItem(title: "House of The Dragon", poster: "houseOfTheDragon-poster")])
    }()
    
    private let trendingToday: ListSection = {
        .trendingToday([ListItem(title: "Pinocchio", poster: "pinocchio-poster")])
    }()
    
    private let trendingThisWeek: ListSection = {
        .trendingThisWeek([ListItem(title: "Fall", poster: "mock-poster")])
    }()
    
    var pageData: [ListSection] {
        //[storiesPeople, popularMovies, popularTV, trendingToday, trendingThisWeek]
        [storiesPeople]
    }
}
