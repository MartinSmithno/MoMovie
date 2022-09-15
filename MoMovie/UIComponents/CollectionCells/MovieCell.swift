import UIKit

final class MovieCell: UICollectionViewCell {
    static let id = "MovieCell"
    
    private let poster: UIImage = {
        let image = UIImage()
        return image
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        
        return title
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
}
