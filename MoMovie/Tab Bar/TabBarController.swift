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

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .dynamicColor(light: Colors.main, dark: Colors.grey)
        setTabBarItemAppearance(appearance.stackedLayoutAppearance)
        tabBar.standardAppearance = appearance
        if #available(iOS 15, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setTabBarItemAppearance(_ appearance: UITabBarItemAppearance) {
        let tabBarFontLight = UIFont(name: "Helvetica Light", size: 10)!
        let tabBarFontBold = UIFont(name: "Helvetica Light", size: 10)!
        appearance.normal.iconColor = .darkGray
        appearance.normal.titleTextAttributes = [
            .font: tabBarFontLight,
            .foregroundColor: UIColor.dynamicColor(light: Colors.lightOrange, dark: Colors.darkOrange)
        ]
        appearance.selected.titleTextAttributes = [
            .font: tabBarFontBold,
            .foregroundColor: UIColor.dynamicColor(light: Colors.lightOrange, dark: Colors.darkOrange)
        ]
    }
}
