import UIKit

final class LoginVC: UIViewController {
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email address or phone number"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textColor = .dynamicColor(light: .black, dark: Colors.sand)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.leading
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textColor = .dynamicColor(light: .black, dark: Colors.sand)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.leading
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let lineBetweenButtons: UIView = {
        let line  = UIView()
        line.layer.borderColor = UIColor.darkGray.cgColor
        line.frame.size.height = 1
        
        return line
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
        
    }
    
    private func addViews() {
        
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        ])
    }
}
