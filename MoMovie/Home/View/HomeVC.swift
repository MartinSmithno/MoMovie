import UIKit

enum ListSection {
    case popularMovies([ListItem])
    case popularTV([ListItem])
    case trendingToday([ListItem])
    case trendingThisWeek([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .popularMovies(let item),
                .popularTV(let item),
                .trendingToday(let item),
                .trendingThisWeek(let item):
            return item
        }
    }
    
    var title: String {
        switch self {
        case .popularMovies:
            return "Popular Movies"
        case .popularTV:
            return "Popular TV Shows"
        case .trendingToday:
            return "Trending Today"
        case .trendingThisWeek:
            return "Trending This Week"
        }
    }
}

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
    private let sections = MockData.shared.pageData
    
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
        setupCollectionView()
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
            trendingCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2.0),
            
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            tableView.topAnchor.constraint(equalTo: trendingCollectionView.bottomAnchor, constant: 6.0),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -2.0),
            
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
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8.0
        
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        trendingCollectionView.collectionViewLayout = layout
        trendingCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.id)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return sections[section].count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.id, for: indexPath)
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        
        return cell
    }
}
