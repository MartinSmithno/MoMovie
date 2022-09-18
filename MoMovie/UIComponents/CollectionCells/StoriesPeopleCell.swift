import UIKit

final class StoriesPeopleCell: UICollectionViewCell {
    
    static let id = "StoriesPeopleCell"
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        guard let image = UIImage(named: "tom-hardy") else {
            imageView.image = UIImage(named: "profile-default")!
            return imageView
        }
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        profileImage.fill(parentView: self)
    }
}
