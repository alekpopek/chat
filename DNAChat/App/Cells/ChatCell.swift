//
//  ChatCell.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SDWebImage

final class ChatCell: UITableViewCell, Reusable {
    private(set) lazy var nameLabel: UILabel = makeNameLabel()
    private(set) lazy var messageLabel: UILabel = makeMessageLabel()
    private(set) lazy var timeagoLabel: UILabel = makeTimeagoLabel()
    private(set) lazy var avatarImageView: UIImageView = makeAvatarImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        accessoryType = .none
    }
    
    func configure(with item: Message) {
        nameLabel.text = item.name
        messageLabel.text = item.message
        timeagoLabel.text = item.date.timeAgo
        avatarImageView.sd_setImage(with: URL(string: item.avatar), placeholderImage: Style.placeholderImage)
    }
}

// MARK: - Setup

private extension ChatCell {
    func setupViews() {
        selectionStyle = .none
        [nameLabel, messageLabel, timeagoLabel, avatarImageView].forEach(addSubview)
    }

    func setupConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Style.padding10)
            $0.top.equalToSuperview().inset(Style.padding10)
            $0.width.height.equalTo(Style.avatarSize)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(Style.padding10)
            $0.top.equalToSuperview().offset(Style.padding10)
            $0.height.equalTo(Style.size20)
        }
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(Style.padding10)
            $0.trailing.equalToSuperview().inset(Style.padding10)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalToSuperview().inset(Style.padding10)
            $0.height.greaterThanOrEqualTo(Style.size20)
        }
        timeagoLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(Style.padding10)
            $0.top.equalToSuperview().inset(Style.padding10)
            $0.height.equalTo(Style.size16)
        }
    }
}

// MARK: - Factory

private extension ChatCell {
    func makeAvatarImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode =  .scaleAspectFill
        imageView.layer.cornerRadius = Style.avatarSize / 2
        imageView.clipsToBounds = true
        return imageView
    }

    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Style.colorPrimary
        label.font = UIFont.systemFont(
            ofSize: Style.nameFontSize,
            weight: .medium
        )
        return label
    }

    func makeMessageLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Style.colorSecondary
        label.numberOfLines = 0
        label.font = UIFont.systemFont(
            ofSize: Style.messageFontSize,
            weight: .regular
        )
        return label
    }

    func makeTimeagoLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Style.colorSecondary
        label.font = UIFont.systemFont(
            ofSize: Style.timeagoFontSize,
            weight: .regular
        )
        return label
    }
}
