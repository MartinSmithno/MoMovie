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
            case .blue:
                 return nil
            case .orange:
                return nil
            case .white:
                return nil
            }
        }
    }
    
    func setStyle(_ style: NavigationBarStyle) {
        let defaultTitleFontSize = 19.0
        let largeTitleFontSize = 34.0
        
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: style.tintColor
        
        ]
    }
}
