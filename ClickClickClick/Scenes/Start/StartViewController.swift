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
    private lazy var newYearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(
            UIImage(named: "mainButton"),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(newYearButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private let newYearLabel: UILabel = {
        let label = UILabel()
        label.text = "Новогодняя тема"
        return label
    }()
    
    private let newYearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Actions

    @objc
    func newYearButtonPressed() {
        newYearButton.pushAnimate { [weak self] in
            self?.presenter?.newYearButtonPressed()
        }
    }
    
}

// MARK: - StartViewProtocol Impl

extension StartViewController: StartViewProtocol {}

// MARK: - PrivateMethods

private extension StartViewController {
    func setupViewController() {
        view.backgroundColor = .white
        title = "Выберите тему"
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        newYearStackView.addArrangedSubview(newYearButton)
        newYearStackView.addArrangedSubview(newYearLabel)
        view.addSubviews(newYearStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            newYearButton.heightAnchor.constraint(equalToConstant: 119),
            newYearButton.widthAnchor.constraint(equalToConstant: 125),
            newYearStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newYearStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
