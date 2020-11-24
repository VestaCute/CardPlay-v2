//
//  ConcetrationGame.swift
//  Story
//
//  Created by Vesta Kondratjeva on 27.09.2020.
//

import Foundation

class ConcetrationGame {
    
    var cards = [Card] ()
    
    var indexOfOneOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneOnlyFaceUpCard = index
            }
        }
    }
    
    init(nubmerOfPairsOfCard: Int) {
        for _ in 1...nubmerOfPairsOfCard {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
