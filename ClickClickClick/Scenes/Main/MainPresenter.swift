//
//  MainPresenter.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let defaultsStorage: DefaultsManagerable
    
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

extension MainPresenter: MainPresenterProtocol {}
