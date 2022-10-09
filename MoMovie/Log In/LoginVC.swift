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
    
    private var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        button.backgroundColor = Colors.lightOrange
        button.tintColor = Colors.grey
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(
            top: 15,
            left: 25,
            bottom: 15,
            right: 25
        )
        
        return button
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Create New Account", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        button.backgroundColor = Colors.green
        button.tintColor = Colors.darkGreen
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(
            top: 15,
            left: 25,
            bottom: 15,
            right: 25
        )
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
        addViews()
        addConstraints()
        
    }
    
    private func addViews() {
        
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        ])
    }
}
