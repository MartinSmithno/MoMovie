import UIKit

extension UINavigationBar {
    enum NavigationBarStyle {
        case blue
        case orange
        case white

        var backgroundColor: UIColor {
            switch self {
            case .blue: return .dynamicColor(light: Colors.lightBlue, dark: Colors.darkBlue)
            case .orange: return .dynamicColor(light: Colors.lightOrange, dark: Colors.darkOrange)
            case .white: return .dynamicColor(light: Colors.sand, dark: Colors.grey)
            }
        }
        
        var tintColor: UIColor {
            switch self {
            case .blue, .orange:
                return .dynamicColor(light: Colors.sand, dark: Colors.warmSand)
            case .white:
                return .dynamicColor(light: Colors.grey, dark: Colors.warmSand)
            }
        }
    }
    
    func setStyle(_ style: NavigationBarStyle) {
        let defaultTitleFontSize = 19.0
        let largeTitleFontSize = 34.0
        
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: style.tintColor,
            NSAttributedString.Key.font: UIFont(
            name: "HelveticaNeue", size: defaultTitleFontSize
            )!
        ]
        
        let largeTitleAttributes = [
            NSAttributedString.Key.foregroundColor: style.tintColor,
            NSAttributedString.Key.font: UIFont(
            name: "HelveticaNeue", size: largeTitleFontSize
            )!
        ]
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = style.backgroundColor
        appearance.titleTextAttributes = titleAttributes
        appearance.largeTitleTextAttributes = largeTitleAttributes
        appearance.buttonAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.font: UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: "HelveticaNeue", size: 16)!)
        ]
        appearance.shadowColor = .clear
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
        tintColor = style.tintColor
    }
}
