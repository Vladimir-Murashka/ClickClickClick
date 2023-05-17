//
//  MainViewController.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

// MARK: - MainViewProtocol

protocol MainViewProtocol: UIViewController {
    func updateClickLabel(value: String)
}

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
    
    private let clickValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1540617863, green: 0.3678298798, blue: 0.03155736679, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 42)
        return label
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView()
        blurView.effect = UIBlurEffect(style: .light)
        blurView.layer.cornerRadius = 12
        blurView.clipsToBounds = true
        blurView.isUserInteractionEnabled = false
        return blurView
    }()
    
    private lazy var changeThemButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "paintbrush")
        button.setImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.1540617863, green: 0.3678298798, blue: 0.03155736679, alpha: 1)
        button.addTarget(
            self,
            action: #selector(changeThemeButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private let changeThemeButtonBlurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView()
        blurView.effect = UIBlurEffect(style: .light)
        blurView.layer.cornerRadius = 12
        blurView.clipsToBounds = true
        blurView.isUserInteractionEnabled = false
        return blurView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.bounds.width < 450 {
            clickValueLabel.font = UIFont.systemFont(ofSize: 42)
        } else {
            clickValueLabel.font = UIFont.systemFont(ofSize: 82)
        }
    }
    
    // MARK: - Actions
    @objc
    private func mainButtonPressed() {
        mainButton.pushAnimate { [weak self] in
            self?.presenter?.mainButtonPressed()
        }
    }
    
    @objc
    private func changeThemeButtonPressed() {
        changeThemButton.pushAnimate { [weak self] in
            self?.presenter?.changeThemeButtonPressed()
        }
    }
}

// MARK: - MainViewProtocol Impl

extension MainViewController: MainViewProtocol {
    func updateClickLabel(value: String) {
        clickValueLabel.text = value
    }
}

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
            mainButton,
            blurView,
            clickValueLabel,
            changeThemeButtonBlurView,
            changeThemButton
        )
    }
    
    func setupConstraints() {
        
        
        let mainButtonWidth: CGFloat = view.bounds.width / 1.572
        let mainButtonHeight: CGFloat = mainButtonWidth / (1000 / 952)
        
        NSLayoutConstraint.activate([
            imageViewBackgroundScreen.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewBackgroundScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewBackgroundScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageViewBackgroundScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainButton.heightAnchor.constraint(equalToConstant: mainButtonHeight),
            mainButton.widthAnchor.constraint(equalToConstant: mainButtonWidth),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            clickValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clickValueLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            changeThemeButtonBlurView.topAnchor.constraint(equalTo: clickValueLabel.topAnchor),
            changeThemeButtonBlurView.bottomAnchor.constraint(equalTo: clickValueLabel.bottomAnchor),
            changeThemeButtonBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            changeThemeButtonBlurView.heightAnchor.constraint(equalTo: clickValueLabel.heightAnchor),
            changeThemeButtonBlurView.widthAnchor.constraint(equalTo: changeThemButton.heightAnchor),
            
            changeThemButton.topAnchor.constraint(equalTo: changeThemeButtonBlurView.topAnchor),
            changeThemButton.leadingAnchor.constraint(equalTo: changeThemeButtonBlurView.leadingAnchor),
            changeThemButton.bottomAnchor.constraint(equalTo: changeThemeButtonBlurView.bottomAnchor),
            changeThemButton.trailingAnchor.constraint(equalTo: changeThemeButtonBlurView.trailingAnchor),
            
            blurView.topAnchor.constraint(equalTo: clickValueLabel.topAnchor, constant: 0),
            blurView.leadingAnchor.constraint(equalTo: clickValueLabel.leadingAnchor, constant: -16),
            blurView.bottomAnchor.constraint(equalTo: clickValueLabel.bottomAnchor, constant: 0),
            blurView.trailingAnchor.constraint(equalTo: clickValueLabel.trailingAnchor, constant: 16),
        ])
    }
}
