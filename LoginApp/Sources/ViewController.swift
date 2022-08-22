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

        let leftIcon = UIImage(systemName: "person.circle")
        textField.setLeftIcon(leftIcon)
        let rightIcon = UIImage(systemName: "checkmark.circle.fill")
        textField.setRightIcon(rightIcon)

        textField.placeholder = "Username"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20

        // Setup keyboard
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no

        textField.addTarget(self, action: #selector(usernameChanged), for: .editingChanged)

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()

        let leftIcon = UIImage(systemName: "lock")
        textField.setLeftIcon(leftIcon)

        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20

        // Setup keyboard
        textField.keyboardType = .asciiCapable
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemIndigo
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20

        // Making shadow for button
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(loginLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
    }

    private func setupLayout() {
        setupBackgroundImageView()
        setupLoginLabel()
        setupUsernameTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupForgotPasswordButton()
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
        if UIDevice().name == "iPhone 8" {
            loginLabel.snp.makeConstraints { make in
                make.top.equalTo(view).offset(80)
                make.left.equalTo(view).offset(10)
                make.right.equalTo(view).offset(-10)
            }
        } else {
            loginLabel.snp.makeConstraints { make in
                make.top.equalTo(view).offset(120)
                make.left.equalTo(view).offset(10)
                make.right.equalTo(view).offset(-10)
            }
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

    private func setupPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(15)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(40)
        }
    }

    private func setupLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(45)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(40)
        }
    }

    private func setupForgotPasswordButton() {
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.centerX.equalTo(view)
        }
    }

    // MARK: - Actions

    @objc private func loginButtonPressed() {
        print("Login button pressed!")
        let textFromUsernameTextField = usernameTextField.text ?? ""
        let textFromPasswordTextField = passwordTextField.text ?? ""
        print("Username is \(textFromUsernameTextField)")
        print("Password is \(textFromPasswordTextField) \n")
    }

    @objc private func usernameChanged() {
        if usernameTextField.hasText {
            usernameTextField.rightView?.isHidden = false
        } else {
            usernameTextField.rightView?.isHidden = true
        }
    }

    @objc private func forgotPasswordButtonPressed() {
        print("User forgot his password!")
    }
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

    func setRightIcon(_ image: UIImage?) {
        if let icon = image {
            let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
            iconView.tintColor = .systemGreen
            iconView.image = icon
            let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
            iconContainerView.addSubview(iconView)
            rightView = iconContainerView
            rightView?.isHidden = true
            rightViewMode = .always
        }
    }
}

