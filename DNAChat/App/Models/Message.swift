//
//  Message.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

struct Message {
    var id: String = UUID().uuidString
    var name: String
    var message: String
    var date: Date
    var avatar: String
}

extension Message: Persistable {
    typealias Entity = MessageEntity
    
    init(from entity: MessageEntity) {
        id = entity.id
        name = entity.name
        message = entity.message
        date = entity.date
        avatar = entity.avatar
    }
    
    func toEntity() -> MessageEntity {
        let entity = MessageEntity()
        entity.id = id
        entity.name = name
        entity.message = message
        entity.date = date
        entity.avatar = avatar
        return entity
    }
}

// MARK: - Object generators

extension Message {
    static func randomMessage() -> Message {
        let randomSentence: String = RandomWords.sentences.randomElement() ?? ""
        return Message.randomMessage(withText: randomSentence)
    }

    static func randomMessage(withText text: String) -> Message {
        let randomName: String = RandomWords.names.randomElement() ?? ""
        return Message(
            name: randomName,
            message: text,
            date: Date(),
            avatar: Images.randomImagePath
        )
    }
}
