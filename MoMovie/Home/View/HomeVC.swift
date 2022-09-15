import UIKit

final class HomeVC: UIViewController {
    
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
    
    private var trendingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var toolbar = GradientToolbar()
    private var tableView = UITableView()
    
    private var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        button.backgroundColor = Colors.lightOrange
        button.tintColor = Colors.darkBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(
            top: 15,
            left: 25,
            bottom: 15,
            right: 25
        )
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
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
        view.addAutolayoutSubView(trendingCollectionView)
        view.addAutolayoutSubView(tableView)
        view.addAutolayoutSubView(toolbar)
        toolbar.addAutolayoutSubView(searchButton)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2.0),
            searchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 2.0),
            searchTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 60.0),
            
            trendingCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2.0),
            trendingCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 6.0),
            trendingCollectionView.leadingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2.0),

            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            tableView.topAnchor.constraint(equalTo: trendingCollectionView.bottomAnchor, constant: 6.0),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            toolbar.heightAnchor.constraint(equalToConstant: 60),
            toolbar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2),
            toolbar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -2),
            
            searchButton.centerXAnchor.constraint(equalTo: toolbar.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: toolbar.centerYAnchor)
        ])
    }
    
    @objc
    func buttonAction() {
        print("Button pressed")
    }
    
    
}

