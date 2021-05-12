//
//  AppStyles.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

struct Style {
    static let colorBackground = UIColor.systemBackground
    static let colorPrimary = UIColor.label
    static let colorSecondary = UIColor.secondaryLabel
    static let colorTertiary = UIColor.tertiaryLabel
    static let colorQuaternary = UIColor.quaternaryLabel
    
    static let colorBlue = UIColor(red: 70/255, green: 182/255, blue: 245/255, alpha: 1.0)
}

// MARK: - Sizes and paddings

extension Style {
    static let separatorHeight: CGFloat = 1.0
    static let minimumTextViewHeight: CGFloat = 20.0
    static let maximumTextViewHeight: CGFloat = 200.0
    static let textViewInset: CGFloat = 5.0
    
    static let avatarSize: CGFloat = 40.0
    
    static let sendButtonFontSize: CGFloat = 16.0
    static let sendButtonTopMargin: CGFloat = 30.0
    static let sendButtonWidth: CGFloat = 80.0
    
    static let textViewFontSize: CGFloat = 16.0
    static let nameFontSize: CGFloat = 14.0
    static let messageFontSize: CGFloat = 14.0
    static let timeagoFontSize: CGFloat = 10.0

    static let padding16: CGFloat = 16.0
    static let padding10: CGFloat = 10.0
    
    static let size20: CGFloat = 20.0
    static let size16: CGFloat = 16.0
}

// MARK: - Images

extension Style {
    static let placeholderImage = UIImage(named: "placeholderImage")
}
