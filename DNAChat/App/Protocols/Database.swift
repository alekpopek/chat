//
//  Database.swift
//  DNAChat
//
//  Created by Aleksander Popek on 12/05/2021.
//

import Foundation
import RealmSwift

protocol Database {
    func save<T: Persistable>(_ object: T)
    func save<T: Persistable>(_ objects: [T])
    
    func get<T: Persistable>(
        _ type: T.Type,
        mathing predicate: NSPredicate?,
        sortedBy sortDescriptors: [SortDescriptor]
    ) -> [T]    
}

extension Database {
    func save<T: Persistable>(_ object: T) {
        save([object])
    }
}
