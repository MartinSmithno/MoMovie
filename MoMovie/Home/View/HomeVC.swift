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
        textField.returnKeyType = .search
        
        return textField
    }()
    
    var collectionView: UICollectionView!
    
    private var toolbar = GradientToolbar()
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
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
        self.title = "Home"
        print("HomePage loadded")
        searchTextField.delegate = self
        setupCollectionView()
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addAutolayoutSubView(searchTextField)
        view.addAutolayoutSubView(collectionView)
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
            
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2.0),
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 6.0),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -2.0),
            collectionView.bottomAnchor.constraint(equalTo: toolbar.topAnchor, constant: -6.0),
            
            toolbar.heightAnchor.constraint(equalToConstant: 60),
            toolbar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
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
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.id)
        collectionView.register(StoriesPeopleCell.self, forCellWithReuseIdentifier: StoriesPeopleCell.id)
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.id)
        collectionView.register(SegmentedFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SegmentedFooter.id)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.id)
    }
    
    //We want to return different layout for different sections
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            let rolle = self!.sections[sectionIndex]
            switch rolle {
            case .storiesPeople:
                //item that fills container
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(70), heightDimension: .estimated(70)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [self!.supplementaryHeaderItem()]
                section.contentInsets = .init(top: 4, leading: 10, bottom: 4, trailing: 10)
                //return
                return section
            case .popularMovies:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(200), heightDimension: .estimated(360)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 4, leading: 10, bottom: 4, trailing: 10)
                section.boundarySupplementaryItems = [self!.supplementaryHeaderItem()]
                return section
            case .popularTV:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(200), heightDimension: .estimated(360)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 4, leading: 10, bottom: 4, trailing: 10)
                section.boundarySupplementaryItems = [self!.supplementaryHeaderItem()]
                return section
            case .trendingToday:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(160), heightDimension: .estimated(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 4, leading: 10, bottom: 4, trailing: 10)
                section.boundarySupplementaryItems = [self!.supplementaryHeaderItem(), self!.supplementaryFooterItem()]
                return section
            }
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerLayout, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        return header
    }
    
    private func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(25))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerLayout, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footer
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .storiesPeople:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesPeopleCell.id, for: indexPath) as! StoriesPeopleCell
            return cell
        case .popularMovies:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.id, for: indexPath) as! MovieCell
            return cell
        case .popularTV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.id, for: indexPath) as! MovieCell
            return cell
        case .trendingToday:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.id, for: indexPath) as! TrendingCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.id, for: indexPath) as! CollectionViewHeader
            header.setup(sections[indexPath.section].title)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SegmentedFooter.id, for: indexPath) as! SegmentedFooter
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = searchTextField.text else { return false }
        searchTextField.endEditing(true)
        print(text)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //We should think we can send request here.
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "What do you want to watch today?"
            return false
        }
    }
    
}
