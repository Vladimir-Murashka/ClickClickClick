//
//  AlertManager.swift
//  ClickClickClick
//
//  Created by Максим Косников on 23.12.2022.
//

import Foundation
import UIKit


protocol AlertManagerable {
    func alert(
        viewController: UIViewController?,
        title: String?,
        message: String?,
        firstButtonTitle: String?,
        firstActionBlock: (() -> Void)?
    )
}

final class AlertManager {}

extension AlertManager: AlertManagerable {
    func alert(
        viewController: UIViewController?,
        title: String?,
        message: String?,
        firstButtonTitle: String?,
        firstActionBlock: (() -> Void)?
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: firstButtonTitle,
            style: .default) { _ in
                firstActionBlock?()
            }
        
        alertController.addAction(action)
        viewController?.present(alertController, animated: true)
    }
}
