//
//  Repository.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func get(completion: ([T]) -> Void)
    func save(_ object: T)
}
