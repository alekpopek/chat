//
//  ChatViewController.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

class ChatViewController: ViewController<ChatView, ChatViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Strings.chat
        
        setupViews()
        setupKeyboardEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getMessages { [weak self] in
            DispatchQueue.main.async {
                self?.contentView.tableView.reloadData()
                self?.scrollToBottom(animated: false)
            }
        }
    }
}

// MARK: - Setup

private extension ChatViewController {
    func setupViews() {
        contentView.tableView.dataSource = self
        contentView.tableView.keyboardDismissMode = .interactive
        contentView.accessoryView.button.addTarget(
            self,
            action: #selector(didTapSend),
            for: .touchUpInside
        )
    }
}

// MARK: - Private methods

private extension ChatViewController {
    func scrollToBottom(animated: Bool = true) {
        let indexPath = IndexPath(row: viewModel.messages.count - 1, section: 0)
        self.contentView.tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
    }
}

// MARK: - Actions

private extension ChatViewController {
    @objc func didTapSend() {
        guard let text = contentView.accessoryView.textView.text else {
            return
        }
        viewModel.send(text)
        contentView.accessoryView.textView.reset()
        contentView.tableView.reloadData()
        scrollToBottom()
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.messages[indexPath.row]
        let cell: ChatCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: item)
        return cell
    }
}
