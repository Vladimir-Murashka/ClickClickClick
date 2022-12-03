//
//  UIView.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

extension UIView {
    
    func myAddSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            myAddSubview(view)
        }
    }
    
    func pushAnimate(_ completion: (() -> Void)?) {
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.transform = CGAffineTransform(
                    scaleX: 0.9,
                    y: 0.9
                )
            },
            completion: { _ in
                UIView.animate(withDuration: 0.05) {
                    self.transform = CGAffineTransform.identity
                } completion: { _ in
                    completion?()
                }
            })
    }
}
