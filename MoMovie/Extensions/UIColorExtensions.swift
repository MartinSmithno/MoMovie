import UIKit

extension UIColor {
    class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { traitCollection -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }
}
