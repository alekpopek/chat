//
//  Reusable.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: AnyObject {
    static var reuseIdentifier: String {
        NSStringFromClass(self)
    }
}
