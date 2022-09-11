import UIKit

class HomeVC: UIViewController {
    
    private var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .dynamicColor(light: .black, dark: Colors.sand)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.search
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var searchButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
        self.title = "Home"
        print("HomePage loadded")
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addAutolayoutSubView(searchTextField)
        view.addAutolayoutSubView(searchButton)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2.0),
            searchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 2.0),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: 4.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 60.0),
            
            searchButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 2.0),
            searchButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 2.0),
            searchButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor)
        ])
    }
    
    
}

