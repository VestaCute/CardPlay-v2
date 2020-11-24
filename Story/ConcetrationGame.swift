//
//  ConcetrationGame.swift
//  Story
//
//  Created by Vesta Kondratjeva on 27.09.2020.
//

import Foundation

class ConcetrationGame {
    
    var cards = [Card] ()
    
    var indexOfOneOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
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
