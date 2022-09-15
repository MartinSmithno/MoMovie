import UIKit

enum Tab: Int, CaseIterable {
    case favorites = 0
    case home = 1
    case profile = 2
    
    var title: String {
        switch self {
        case .favorites: return "Favorites"
        case .home: return "Home"
        case .profile: return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .favorites: return "heart.fill"
        case .home: return "house"
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
        appearance.backgroundColor = .dynamicColor(light: Colors.lightOrange, dark: Colors.darkBlue)
        setTabBarItemAppearance(appearance.inlineLayoutAppearance)
        setTabBarItemAppearance(appearance.stackedLayoutAppearance)
        setTabBarItemAppearance(appearance.compactInlineLayoutAppearance)
        tabBar.standardAppearance = appearance
        if #available(iOS 15, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setTabBarItemAppearance(_ appearance: UITabBarItemAppearance) {
        let tabBarFontLight = UIFont(name: "Helvetica Light", size: 20)!
        let tabBarFontBold = UIFont(name: "Helvetica Light", size: 20)!
        appearance.normal.iconColor = .systemGray
        appearance.normal.titleTextAttributes = [
            .font: tabBarFontLight,
            .foregroundColor: UIColor.dynamicColor(light: Colors.sand, dark: Colors.warmSand)
        ]
        appearance.selected.iconColor = .white
        appearance.selected.titleTextAttributes = [
            .font: tabBarFontBold,
            .foregroundColor: UIColor.dynamicColor(light: Colors.lightOrange, dark: Colors.darkOrange)
        ]
    }
}
