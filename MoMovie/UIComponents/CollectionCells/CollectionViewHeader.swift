import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    
    static let id = "Header"
    
    private let header: UILabel = {
        let header = UILabel()
        header.font = UIFont.boldSystemFont(ofSize: 18)
        header.textColor = .white
        header.text = "Stories"
        header.textAlignment = .center
        header.backgroundColor = .orange
        header.layer.masksToBounds = true
        
        return header
    }()
    
    public func setup() {
        backgroundColor = .orange
        addSubview(header)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        header.frame = bounds
    }
}
