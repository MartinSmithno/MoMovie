import UIKit

final class StoriesPeopleCell: UICollectionViewCell {
    
    static let id = "StoriesPeopleCell"
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "tom-hardy")
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 35

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addAutolayoutSubView(profileImage)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
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
