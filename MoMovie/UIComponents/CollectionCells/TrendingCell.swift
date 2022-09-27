import UIKit

final class TrendingCell: UICollectionViewCell {
    
    static let id = "TrendingCell"
    
    private var previewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
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
        imageView.layer.cornerRadius = Shapes.imageCornerRadius
        
        return imageView
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: Shapes.bigFontSize)
        title.text = "Fall"
        title.lineBreakMode = .byWordWrapping
        
        return title
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
        contentView.backgroundColor = .clear
        contentView.layer.borderColor = UIColor.systemOrange.cgColor
        contentView.layer.borderWidth = Shapes.cellBorderWidth
        contentView.layer.cornerRadius = Shapes.cellCornerRadius
    }
    
    private func addViews() {
        contentView.addAutolayoutSubView(previewStackView)
        previewStackView.addAutolayoutSubView(poster)
        previewStackView.addAutolayoutSubView(title)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalTo: previewStackView.leadingAnchor),
            poster.topAnchor.constraint(equalTo: previewStackView.topAnchor),
            poster.trailingAnchor.constraint(equalTo: title.leadingAnchor, constant: -Shapes.verticalMargin),
            poster.bottomAnchor.constraint(equalTo: previewStackView.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: previewStackView.topAnchor),
            title.trailingAnchor.constraint(equalTo: previewStackView.trailingAnchor, constant: -Shapes.verticalMargin),
            title.bottomAnchor.constraint(equalTo: previewStackView.bottomAnchor)
        ])
        
    }
    
    
    
    
    
}
