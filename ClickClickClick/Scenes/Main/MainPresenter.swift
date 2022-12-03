//
//  MainPresenter.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func mainButtonPressed()
}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let defaultsStorage: DefaultsManagerable
    private var clickValueLabel = 0
    
    // MARK: - Initializer
    
    init(
        sceneBuildManager: Buildable,
        defaultsStorage: DefaultsManagerable
    ) {
        self.sceneBuildManager = sceneBuildManager
        self.defaultsStorage = defaultsStorage
    }
}

//MARK: - MainPresenterExtension

extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        clickValueLabel = defaultsStorage.fetchObject(type: Int.self, for: .clickValue) ?? 1000000
        viewController?.updateClickLabel(value: String(clickValueLabel))
    }
    
    func mainButtonPressed() {
        clickValueLabel -= 1
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        viewController?.updateClickLabel(value: String(clickValueLabel))
        defaultsStorage.saveObject(clickValueLabel, for: .clickValue)
    }
}
