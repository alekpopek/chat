//
//  LocalDatabase.swift
//  DNAChat
//
//  Created by Aleksander Popek on 12/05/2021.
//

import Foundation
import RealmSwift

final class LocalDatabase: Database {
    
    private var realm: Realm? {
        do {
            return try Realm()
        } catch {
            print("REALM: Realm initialization error")
            return nil
        }
    }
}

// MARK: - Public methods

extension LocalDatabase {
    /// Used to save objecs to database
    /// - Parameter objects: array of objects
    func save<T>(_ objects: [T]) where T : Persistable {
        autoreleasepool {
            do {
                try realm?.write {
                    let managedObjects = objects.map { $0.toEntity() }
                    realm?.add(managedObjects, update: .modified)
                }
            } catch {
                print("REALM: Save error")
            }
        }
    }
    
    /// Used to read objects from database
    /// - Parameters:
    ///   - type: object type
    ///   - predicate: logical filtering conditions
    ///   - sortDescriptors: a list of sort descriptors
    /// - Returns: array of objects of given type
    func get<T>(_ type: T.Type, mathing predicate: NSPredicate?, sortedBy sortDescriptors: [SortDescriptor]) -> [T] where T : Persistable {
        guard let results = getResults(type, mathing: predicate, sortedBy: sortDescriptors) else { return [] }
        return results.compactMap(T.init(from: ))
    }    
}

// MARK: - Private helper functions

private extension LocalDatabase {
    func getResults<T: Persistable>(
        _ type: T.Type,
        mathing predicate: NSPredicate?,
        sortedBy sortDescriptors: [SortDescriptor]
    ) -> Results<T.Entity>? {
        var results = realm?.objects(T.Entity.self)
        if let predicate = predicate {
            results = results?.filter(predicate)
        }
        if !sortDescriptors.isEmpty {
            results = results?.sorted(by: sortDescriptors)
        }
        return results
    }
}

// MARK: - Data generation

extension LocalDatabase {
    func insertInitialDataIfNeeded() {
        guard let realm = realm else { return }
        if realm.isEmpty {
            var messages: [Message] = []
            for _ in 1...50 {
                messages.append(Message.randomMessage())
            }
            save(messages)
        }
    }
}
