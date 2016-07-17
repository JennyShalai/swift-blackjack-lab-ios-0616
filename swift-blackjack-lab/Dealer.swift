//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Jenny on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {

    var deck: Deck
    var house: House
    var player: House
    var bet: UInt = 0
    
    init() {
        self.deck = Deck.init()
        self.house = House.init(name: "House")
        self.player = House.init(name: "Player")
    }
    
    func placeBet(bet: UInt) -> Bool {
        if self.house.canPlaceBet(bet) && self.player.canPlaceBet(bet) {
            self.bet = bet
            return true
        }
        return false
    }
    
    func deal() {
        self.player.stayed = false
        self.player.cards.removeAll()
        self.house.stayed = false
        self.house.cards.removeAll()
        self.player.cards.append(self.deck.drawCard())
        self.player.cards.append(self.deck.drawCard())
        self.house.cards.append(self.deck.drawCard())
        self.house.cards.append(self.deck.drawCard())
    }
    
    func turn(user: House) {
        if user.mustHit && !user.stayed {
            user.cards.append(self.deck.drawCard())
        } else {
            user.stayed = true
        }
    }
    
    func winner() -> String {
        if self.player.blackjack {
            if self.house.blackjack {
                return "house"
            } else {
                return "player"
            }
        } else if self.house.blackjack {
            return "house"
        } else if self.player.busted {
            return "house"
        } else if self.house.busted {
            return "player"
        } else if self.player.cards.count == 5 && !self.player.busted {
            return "player"
        } else if self.player.stayed && self.house.stayed {
            if self.house.handscore >= self.player.handscore {
                return "house"
            } else {
                return "player"
            }
        } else {
            return "no"
        }
    }
    
    func award() -> String {
        switch winner() {
        case "house":
            self.player.didLose(self.bet)
            self.house.didWin(self.bet)
            return "Hacker House wins!"
        case "player":
            self.player.didWin(self.bet)
            self.house.didLose(self.bet)
            return "Hacker Player wins!"
        default:
            return "No winner haha"
        }
    }
    
}

