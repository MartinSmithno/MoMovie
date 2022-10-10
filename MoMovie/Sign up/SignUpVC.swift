import UIKit

final class SignUpVC: UIViewController {
    
    private let nameTextField: UITextField = {
        }()
    
    private let surnameTextField: UITextField = {
    }()
    
    private let mailTextField: UITextField = {
    }()
    
    private let passwordTextField: UITextField = {
    }()
    
    private let confirPasswordTextField: UITextField = {
    }()
    
    private var signUpButton: UIButton = {
    }()
    
    private var birhdate: UIDatePicker = {
        
        return
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.alignment = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.main
        addViews()
        addConstraints()
        
    }
    
    private func addViews() {
        view.addAutolayoutSubView(stackView)
        stackView.addAutolayoutSubView()
        stackView.addAutolayoutSubView()
        stackView.addAutolayoutSubView()
        stackView.addAutolayoutSubView()
        stackView.addAutolayoutSubView()
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
}
