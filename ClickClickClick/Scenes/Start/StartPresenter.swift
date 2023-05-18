//
//  StartPresenter.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

// MARK: - StartPresenterProtocol

protocol StartPresenterProtocol: AnyObject {
    func viewDidLoad()
    func newYearButtonPressed()
}

// MARK: - StartPresenter

final class StartPresenter {
    weak var viewController: StartViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - StartPresenterExtension

extension StartPresenter: StartPresenterProtocol {
    func viewDidLoad() {
        NotificationService.sharedInstance.authorizeNotification()
        NotificationService.sharedInstance.sendNotification()
    }
    func newYearButtonPressed() {
        let viewController = sceneBuildManager.buildMainScreen()
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
