import UIKit

class HomeVC: UIViewController {
    
    private var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 20)
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
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .highlighted)
        button.backgroundColor = .dynamicColor(light: Colors.lightOrange, dark: Colors.sand)
        button.tintColor = .red
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray3.cgColor
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private var toolbar = GradientToolbar()
    private var tableView = UITableView()
    
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
        view.addAutolayoutSubView(tableView)
        view.addAutolayoutSubView(toolbar)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2.0),
            searchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 2.0),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -6.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 60.0),
            
            searchButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 2.0),
            searchButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2.0),
            searchButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor),
            searchButton.widthAnchor.constraint(equalTo: searchButton.heightAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 6.0),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2),
            
            toolbar.heightAnchor.constraint(equalToConstant: 60),
            toolbar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            toolbar.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 4.0),
            toolbar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2),
            toolbar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -2)
        ])
    }
    
    @objc
    func buttonAction() {
        print("Button pressed")
    }
    
    
}

