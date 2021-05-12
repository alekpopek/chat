//
//  Images.swift
//  DNAChat
//
//  Created by Aleksander Popek on 12/05/2021.
//

import Foundation

class Images {
    /// Used to generate a path to random image in Unsplash web service
    static var randomImagePath: String {
        let unsplashPath: String = "https://source.unsplash.com/"
        let unsplashKeyword: String = "profile"
        
        let randomWidth: Int = Int.random(in: 300...600)
        let randomHeight: Int = Int.random(in: 300...600)
        
        return String(format: "%@%ix%i/?%@", unsplashPath, randomWidth, randomHeight, unsplashKeyword)
    }
}
