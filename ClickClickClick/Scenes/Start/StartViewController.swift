//
//  StartViewController.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

// MARK: - StartViewProtocol

protocol StartViewProtocol: UIViewController {}

// MARK: - StartViewController

final class StartViewController: UIViewController {
    var presenter: StartPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private let imageViewBackgroundScreen: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "startBackground")
        return imageView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(
            UIImage(named: "startButton"),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(startButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Actions

    @objc
    private func startButtonPressed() {
        startButton.pushAnimate { [weak self] in
            self?.presenter?.startButtonPressed()
        }
    }
}

// MARK: - StartViewProtocol Impl

extension StartViewController: StartViewProtocol {}

// MARK: - PrivateMethods

private extension StartViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        view.addSubviews(
            imageViewBackgroundScreen,
            startButton
        )
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewBackgroundScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewBackgroundScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
