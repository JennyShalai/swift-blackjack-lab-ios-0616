//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Jenny on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String = ""
    var cards: [Card] = []
    var mayHit: Bool { return getMayHit() }
    var blackjack: Bool { return getBlackjack() }
    var busted: Bool { return getBusted() }
    var stayed: Bool = false
    var handscore: UInt { return getHandScore() }
    var tokens: UInt = 0
    var description: String { return getDescription() }

    init(name: String) {
        self.name = name
        self.tokens = 100
    }
    
    private func getDescription() -> String {
        let currentState = "player: \(self.name) cards: \(self.cards) handscore: \(self.handscore) blackjack:\(self.blackjack) busted:\(self.busted) stayed:\(self.stayed) tokens: \(self.tokens)"
        return currentState
    }
    
    private func getHandScore() -> UInt {
        var numberAcesInHand = 0
        var score = UInt(0)
        for card in self.cards {
            score += card.cardValue
            if card.rank == "A" {
                numberAcesInHand += 1
            }
        }
        if numberAcesInHand > 0 && score <= 11 {
            score += 10
        }
        return score
    }
    
    private func getBlackjack() -> Bool {
        return self.cards.count == 2 && self.handscore == 21
    }
    
    private func getBusted() -> Bool {
        return self.handscore > 21
    }
    
    private func getMayHit() -> Bool {
        return !self.blackjack && !self.stayed && !self.busted
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return self.tokens >= bet
    }
    
    func didWin(bet: UInt) {
        self.tokens += bet
    }
    func didLose(bet: UInt) {
        self.tokens -= bet
    }
    
}

