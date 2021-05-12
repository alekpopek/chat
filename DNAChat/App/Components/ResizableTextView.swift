//
//  ResizableTextView.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

class ResizableTextView: UITextView {
    
    private(set) lazy var placeholderLabel: UILabel = makePlaceholderLabel()

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        if size.height > Style.maximumTextViewHeight {
            size.height = Style.maximumTextViewHeight
        }
        isScrollEnabled = size.height >= Style.maximumTextViewHeight
        return size
    }
    
    func reset() {
        text = ""
        placeholderLabel.isHidden = false
        invalidateIntrinsicContentSize()
    }
}

// MARK: - Setup

private extension ResizableTextView {
    func setupViews() {
        addSubview(placeholderLabel)
        delegate = self
    }
    
    func setupConstraints() {
        placeholderLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(Style.textViewInset + Style.padding16)
            $0.height.equalTo(Style.size20)
        }
    }
}

// MARK: - Factory

private extension ResizableTextView {
    func makePlaceholderLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Style.colorTertiary
        label.font = UIFont.systemFont(
            ofSize: Style.textViewFontSize,
            weight: .regular
        )
        
        label.text = Strings.addComment
        return label
    }
}


// MARK: - UITextViewDelegate

extension ResizableTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        invalidateIntrinsicContentSize()
    }
}
