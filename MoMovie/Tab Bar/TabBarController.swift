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
        //view.backgroundColor = .systemBackground
        //UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FavoritesVC(), title: Tab.favorites.title, image: UIImage(systemName: Tab.favorites.iconName)!),
            createNavController(for: HomeVC(), title: Tab.home.title, image: UIImage(systemName: Tab.home.iconName)!),
            createNavController(for: ProfileVC(), title: Tab.profile.title, image: UIImage(systemName: Tab.profile.iconName)!)
        ]
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .dynamicColor(light: Colors.main, dark: Colors.grey)
        setTabBarItemAppearance(appearance.inlineLayoutAppearance)
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
