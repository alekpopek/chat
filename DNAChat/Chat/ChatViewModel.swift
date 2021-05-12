//
//  ChatViewModel.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

class ChatViewModel: ViewModelProtocol {
    
    let repository: MessageRepository
    var messages: [Message] = []
    
    init(repository: MessageRepository = MessageRepository()) {
        self.repository = repository
    }
    
    func getMessages(_ completion: () -> Void) {
        repository.get { [weak self] messages in
            self?.messages = messages
            completion()
        }
    }
    
    func send(_ text: String) {
        let message = Message.randomMessage(withText: text)
        repository.save(message)
        messages.append(message)
    }
}
