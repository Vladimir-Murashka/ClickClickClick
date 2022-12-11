//
//  SceneBuildManager.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

protocol Buildable {
    func buildStartScreen() -> StartViewController
    func buildMainScreen() -> MainViewController
}

final class SceneBuildManager {
    private let defaultsManager: DefaultsManagerable
    private let audioManager: AudioManagerable
    
    init() {
        defaultsManager = DefaultsManager()
        audioManager = AudioManager()
    }
}

extension SceneBuildManager: Buildable {
    func buildStartScreen() -> StartViewController {
        let viewController = StartViewController()
        let presenter = StartPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildMainScreen() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(
            sceneBuildManager: self,
            defaultsStorage: defaultsManager,
            audioManager: audioManager
        )
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
