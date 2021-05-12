//
//  MessageRepository.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation
import RealmSwift

/// Structure responsible for fetching messages
struct MessageRepository: Repository {
    typealias T = Message
    
    private let database: Database

    init(database: Database = LocalDatabase()) {
        self.database = database
    }
    
    func get(completion: ([Message]) -> Void) {
        let messages = database.get(
            Message.self,
            mathing: nil,
            sortedBy: [
                SortDescriptor(keyPath: "date", ascending: true)
            ]
        )
        completion(messages)
    }
    
    func save(_ object: Message) {
        database.save(object)
    }
}
