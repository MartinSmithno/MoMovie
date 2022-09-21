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

    private var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Today", "This Week"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.green
        segmentedControl.backgroundColor = UIColor.systemOrange
        //segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
        
    override func layoutSubviews() {
        super.layoutSubviews()
        header.frame = bounds
        addSubview(stackView)
        stackView.addSubview(header)
        stackView.addSubview(segmentedControl)
    }
    
    func setup(_ title: String) {
        header.text = title
    }
}
