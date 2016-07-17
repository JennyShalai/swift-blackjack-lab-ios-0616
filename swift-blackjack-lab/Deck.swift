//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Jenny on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var remainingCards: [Card] = []
    var dealtCards: [Card] = []
    var description: String { return getDescription() }
    
    init() {
        self.standartDeck52CardsInit()
    }
    
    func standartDeck52CardsInit() {
        for rank in Card.validRanks() {
            for suit in Card.validSuits() {
                self.remainingCards.append(Card.init(suit: suit, rank: rank))
            }
        }
    }
    
    func drawCard() -> Card {
        let nextCard = self.remainingCards.removeLast()
        self.dealtCards.append(nextCard)
        return nextCard
    }
    
    func shuffle() {
        self.remainingCards.removeAll()
        self.dealtCards.removeAll()
        self.standartDeck52CardsInit()
        var copyDech = self.remainingCards
        self.remainingCards.removeAll()
        let counter = copyDech.count - 1
        for _ in 0...counter {
            let randomIndex = Int(arc4random_uniform(UInt32(copyDech.count)))
            self.remainingCards.append(copyDech.removeAtIndex(randomIndex))
        }
    }
    
    
    private func getDescription() -> String {
        var result = "Cards Remaining: \(self.remainingCards.count)"
        for card in self.remainingCards {
            result += " " + card.description
        }
        result += " Cards Dealt: \(self.dealtCards.count)"
        for card in self.dealtCards {
            result += " " + card.description
        }
        return result
    }
    

}
