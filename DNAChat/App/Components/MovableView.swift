//
//  MovableView.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SnapKit

protocol MovableView where Self: UIView {
    var bottomConstraint: Constraint? { get }

    func keyboardShown(_ keyboardHeight: CGFloat)
    func keyboardDismissed()
}

extension MovableView {

    func keyboardShown(_ keyboardHeight: CGFloat) {
        let offset = 16 + keyboardHeight - safeAreaInsets.bottom
        animateConstraintChange(offset: offset)
    }

    func keyboardDismissed() {
        animateConstraintChange(offset: 16)
    }

    private func animateConstraintChange(offset: CGFloat) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.3,
            delay: .zero,
            options: [.preferredFramesPerSecond60, .curveEaseOut],
            animations: {
                self.bottomConstraint?.update(offset: -offset)
                self.layoutIfNeeded()
            },
            completion: nil
        )
    }
}
