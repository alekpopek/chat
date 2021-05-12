//
//  Persistable.swift
//  DNAChat
//
//  Created by Aleksander Popek on 12/05/2021.
//

import Foundation
import RealmSwift

protocol Persistable {
    associatedtype Entity: Object
    
    var id: String { get }
    
    init(from entity: Entity)
    
    func toEntity() -> Entity
}
