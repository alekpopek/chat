//
//  ChatView.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit
import SnapKit

final class ChatView: ContentView {
    
    private(set) lazy var tableView: UITableView = makeTableView()
    private(set) lazy var accessoryView: AccessoryView = makeAccessoryView()
    
    override func setupViews() {
        super.setupViews()

        addSubview(tableView)
        addSubview(accessoryView)
    }

    override func setupConstraints() {
        super.setupConstraints()

        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(accessoryView.snp.top)
        }
        accessoryView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            bottomConstraint = $0.bottom.equalTo(safeAreaLayoutGuide).constraint
        }
    }
}

// MARK: - Factory

private extension ChatView {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.register(ChatCell.self)
        return tableView
    }

    func makeAccessoryView() -> AccessoryView {
        let view = AccessoryView()
        return view
    }
}
