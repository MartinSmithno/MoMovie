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
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
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
            createNavController(for: ViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
        ]
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
