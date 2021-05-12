//
//  AccessoryView.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SnapKit

class AccessoryView: UIView {
    
    private(set) lazy var textView: ResizableTextView = makeResizableTextView()
    private(set) lazy var button: UIButton = makeButton()
    private(set) lazy var separator: UIView = makeSeparator()
    
    convenience init() {
        self.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize.zero
    }
}

// MARK:- Setup

private extension AccessoryView {
    func setupViews() {
        backgroundColor = UIColor.systemBackground
        
        addSubview(textView)
        addSubview(button)
        addSubview(separator)
    }
    
    func setupConstraints() {
        textView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Style.padding10)
            $0.top.bottom.equalToSuperview()
            $0.height.lessThanOrEqualTo(Style.maximumTextViewHeight)
            $0.height.greaterThanOrEqualTo(Style.minimumTextViewHeight)
        }
        button.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(textView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(Style.sendButtonWidth)
            $0.height.equalTo(Style.minimumTextViewHeight)
        }
        separator.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(Style.separatorHeight)
        }
    }
}

// MARK: - Factory

private extension AccessoryView {
    func makeResizableTextView() -> ResizableTextView {
        let textView = ResizableTextView()
        textView.textColor = UIColor.label
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(
            ofSize: Style.textViewFontSize,
            weight: .regular
        )
        textView.textContainerInset.top = Style.textViewInset + Style.padding16
        textView.textContainerInset.left = -Style.textViewInset
        return textView
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(
            ofSize: Style.sendButtonFontSize,
            weight: .medium
        )
        button.setTitle(Strings.send, for: .normal)
        button.setTitleColor(Style.colorBlue, for: .normal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.titleEdgeInsets.top = Style.sendButtonTopMargin
        return button
    }
    
    func makeSeparator() -> UIView {
        let view = UIView()
        view.backgroundColor = Style.colorQuaternary
        return view
    }
}
