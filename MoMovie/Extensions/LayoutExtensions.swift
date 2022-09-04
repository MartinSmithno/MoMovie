import UIKit

extension UIView {
    func addAutolayoutSubView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func pin(toCenterOf parentView: UIView) {
        parentView.addAutolayoutSubView(self)
        
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
            centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        ])
    }
    
    func fill(parentView: UIView, inset: CGFloat = 0) {
        parentView.addAutolayoutSubView(self)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: inset),
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -inset),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -inset)
        ])
    }
}
