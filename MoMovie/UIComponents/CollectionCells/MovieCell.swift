import UIKit

final class MovieCell: UICollectionViewCell {
    
    private enum Shapes {
        static let spacing = 2.0
        static let verticalMargin = 4.0
        static let cellCornerRadius = 8.0
        static let cellBorderWidth = 1.0
        static let ratingFontSize = 24.0
        static let bigFontSize = 18.0
        static let regularFontSize = 16.0
        static let smallFontSize = 8.0
    }
    
    static let id = "MovieCell"
    
    private var previewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = Shapes.spacing
        return stackView
    }()
    
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        guard let image = UIImage(named: "mock-poster") else {
            imageView.image = UIImage(named: "default-poster")!
            return imageView
        }
        imageView.image = image

        return imageView
    }()
    
    private let rating: UILabel = {
        let rating = UILabel()
        rating.font = UIFont.boldSystemFont(ofSize: Shapes.ratingFontSize)
        rating.text = "74%"
        
        return rating
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: Shapes.bigFontSize)
        title.text = "Fall"
        
        return title
    }()
    
    private let releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.font = UIFont.systemFont(ofSize: Shapes.regularFontSize)
        releaseDate.text = "11 Aug 2022"
        
        return releaseDate
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addViews()
        addConstraints()
    }
    
    func setupContentView() {
        contentView.backgroundColor = .systemRed
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = Shapes.cellBorderWidth
        contentView.layer.cornerRadius = Shapes.cellCornerRadius
    }
    
    private func addViews() {
        previewStackView.addAutolayoutSubView(poster)
        previewStackView.addAutolayoutSubView(rating)
        previewStackView.addAutolayoutSubView(title)
        previewStackView.addAutolayoutSubView(releaseDate)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalTo: leadingAnchor),
            poster.topAnchor.constraint(equalTo: topAnchor),
            poster.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            rating.centerXAnchor.constraint(equalTo: centerXAnchor),
            rating.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 1.0),
            
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 1.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            releaseDate.leadingAnchor.constraint(equalTo: leadingAnchor),
            releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2.0),
            releaseDate.trailingAnchor.constraint(equalTo: trailingAnchor),
            releaseDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2)
        ])
        
    }
}
