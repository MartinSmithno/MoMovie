import UIKit

final class StoriesPeopleCell: UICollectionViewCell {
    
    static let id = "StoriesPeopleCell"
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(profileImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(_ item: ListItem) {
        guard let image = UIImage(named: item.poster) else {
            return profileImage.image = UIImage(named: "profile-default")!
        }
        profileImage.image = image
        profileImage.layoutIfNeeded()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
}
