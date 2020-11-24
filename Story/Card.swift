//
//  Card.swift
//  Story
//
//  Created by Vesta Kondratjeva on 27.09.2020.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
