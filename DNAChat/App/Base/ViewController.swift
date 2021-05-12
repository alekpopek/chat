//
//  ViewController.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

/// This is the base class for all view controllers. It forces using MVVM architecture
/// with view model injected in class constructor. It also supports content view and
/// keyboard notifications that modify content view height when keyboard appears
class ViewController<View: ContentView, ViewModel: ViewModelProtocol>: UIViewController {

    let contentView: View
    let viewModel: ViewModel
    
    var keyboardWillChangeFrameNotification: NSObjectProtocol?
    
    convenience init() {
        fatalError("init() has not been implemented")
    }
    
    required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.contentView = View()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        // Set contentView constraints to the edges of view
        view = contentView
    }
    
    deinit {
        // Remove keyboard event observers
        NotificationCenter.default.removeObserver(keyboardWillChangeFrameNotification as Any)
    }
}

// MARK: - Keyboard events handling

/// Everytime your viewController requires keyboard to appear call
/// `setupKeyboardEvents()` in `viewDidLoad()` method of your viewController
extension ViewController {
    /// Register keyboard frame change notifications
    func setupKeyboardEvents() {
        keyboardWillChangeFrameNotification = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: nil
        ) { [weak self] notification in
            self?.keyboardWillChangeFrame(notification)
        }
    }

    /// Keyboard will change frame notification handling
    /// - Parameter notification: Keyboard notification object
    private func keyboardWillChangeFrame(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardRect = keyboardFrameValue.cgRectValue
        if keyboardRect.minY >= UIScreen.main.bounds.height {
            contentView.keyboardDismissed()
        } else {
            contentView.keyboardShown(keyboardRect.height)
        }
    }
}
