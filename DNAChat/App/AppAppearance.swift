//
//  AppAppearance.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

final class AppAppearance {
    static func configure() {
        configureNavigationBar()
    }
}

// MARK: - Configuration

private extension AppAppearance {
    static func configureNavigationBar() {
        UINavigationBar.appearance().backgroundColor = Style.colorBackground
        UINavigationBar.appearance().isTranslucent = false
    }
}
