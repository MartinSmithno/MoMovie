import UIKit

final class SegmentedFooter: UICollectionReusableView {
    
    static let id = "SegmentedFooter"
    
    private var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Today", "This Week"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.green
        segmentedControl.backgroundColor = UIColor.systemOrange
        //segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        return segmentedControl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        segmentedControl.frame = bounds
        addSubview(segmentedControl)
    }
    
    func setup(_ title: String) {
    }
}
