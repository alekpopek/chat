//
//  MessageEntity.swift
//  DNAChat
//
//  Created by Aleksander Popek on 12/05/2021.
//

import Foundation
import RealmSwift

@objcMembers
final class MessageEntity: Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var message: String = ""
    dynamic var date: Date = Date()
    dynamic var avatar: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
