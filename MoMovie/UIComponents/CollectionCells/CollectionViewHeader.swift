import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    
    static let id = "Header"
    
    private let header: UILabel = {
        let header = UILabel()
        header.font = UIFont.boldSystemFont(ofSize: 18)
        header.textColor = .systemOrange
        header.text = "Stories"
        header.textAlignment = .left
        header.backgroundColor = .white
        header.layer.masksToBounds = true
        
        return header
    }()
        
    override func layoutSubviews() {
        super.layoutSubviews()
        header.frame = bounds
        addSubview(header)
    }
    
    func setup(_ title: String) {
        header.text = title
    }
}
