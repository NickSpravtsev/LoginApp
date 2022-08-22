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
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.backgroundColor = .white.withAlphaComponent(0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }

    private func setupLayout() {
        setupBackgroundImageView()
        setupLoginLabel()
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

    // MARK: Actions



}

