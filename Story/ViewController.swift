//
//  ViewController.swift
//  Story
//
//  Created by Vesta Kondratjeva on 27.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcetrationGame(nubmerOfPairsOfCard: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    //нажатия
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    //коллекция эмоджи
    private var emojiColletction = "🦊🐶🐰🐸🐷🐔🦄"
    private var emojiDictionary = [Card:String]()
    
    
    // функции
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
        }
    }
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            let randomStringIndex = emojiColletction.index(emojiColletction.startIndex, offsetBy: emojiColletction.count.arc4randomExtension)
            emojiDictionary[card] = String(emojiColletction.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
    @IBOutlet private weak var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0  {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
