//
//  ViewController.swift
//  LoginApp
//
//  Created by Nick Spravtsev on 21.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var backgroundImageView: UIImageView = {
        let imageBackground = UIImage(named: "background")
        let imageView = UIImageView(image: imageBackground)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .white.withAlphaComponent(0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        let icon = UIImage(systemName: "person.circle")
        textField.setLeftIcon(icon)
        textField.placeholder = "Username"
        textField.clearButtonMode = .always
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(loginLabel)
        view.addSubview(usernameTextField)
    }

    private func setupLayout() {
        setupBackgroundImageView()
        setupLoginLabel()
        setupUsernameTextField()
    }

    private func setupBackgroundImageView() {
        backgroundImageView.snp.makeConstraints { make in
            make.right.equalTo(view)
            make.left.equalTo(view)
            make.top.equalTo(view)
            make.bottom.equalTo(view)
        }
    }

    private func setupLoginLabel() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
    }

    private func setupUsernameTextField() {
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(50)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(40)
        }
    }

    // MARK: Actions



}

extension UITextField {
    func setLeftIcon(_ image: UIImage?) {
        if let icon = image {
            let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
            iconView.tintColor = .black
            iconView.image = icon
            let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
            iconContainerView.addSubview(iconView)
            leftView = iconContainerView
            leftViewMode = .always
        }
    }
}

