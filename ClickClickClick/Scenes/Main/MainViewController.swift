//
//  MainViewController.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

// MARK: - MainViewProtocol

protocol MainViewProtocol: UIViewController {}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private let imageViewBackgroundScreen: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainBackground")
        return imageView
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(
            UIImage(named: "mainButton"),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(mainButtonPressed),
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
    private func mainButtonPressed() {
        mainButton.pushAnimate { [weak self] in
            
        }
    }
}

// MARK: - MainViewProtocol Impl

extension MainViewController: MainViewProtocol {}

// MARK: - PrivateMethods

private extension MainViewController {
    func setupViewController() {
        navigationController?.isNavigationBarHidden = true
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        view.addSubviews(
            imageViewBackgroundScreen,
            mainButton
        )
    }
    
    func setupConstraints() {
        let mainButtonHeight: CGFloat = 235
        let mainButtonWidth: CGFloat = 250
        
        NSLayoutConstraint.activate([
            imageViewBackgroundScreen.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewBackgroundScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewBackgroundScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageViewBackgroundScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainButton.heightAnchor.constraint(equalToConstant: mainButtonHeight),
            mainButton.widthAnchor.constraint(equalToConstant: mainButtonWidth),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
