import UIKit

final class GradientToolbar: UIView {
    private var gradientView = UIView()
    private var gradient: CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addAutolayoutSubView(gradientView)
        gradientView.isUserInteractionEnabled = false
        addFadeGradientToToolbar()
        NSLayoutConstraint.activate([
            gradientView.widthAnchor.constraint(equalTo: widthAnchor),
            gradientView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = gradientView.bounds
    }
    
    func addFadeGradientToToolbar() {
        gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        updateGradientColor()
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 0.2)
        gradientView.layer.addSublayer(gradient)
    }
    
    private func updateGradientColor() {
        let gradientColor = UIColor.dynamicColor(light: .white, dark: .black)
        
        gradient.colors = [
            gradientColor.cgColor,
            gradientColor.withAlphaComponent(0).cgColor
        ]
    }
}
