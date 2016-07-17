//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Jenny on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String = ""
    var rank: String = ""
    var cardLabel: String = ""
    var cardValue: UInt = 0
    var description: String { return self.getDescription() }
    
    static func validSuits() -> [String] {
        return ["♠","♥","♦","♣︎"]
    }
    
    static func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = ("\(suit)\(rank)")
        switch rank {
            case "A":
                self.cardValue = 1
                break
            case "2", "3", "4", "5", "6", "7", "8", "9":
                self.cardValue = UInt(rank)!
                break
            case "10", "J", "Q", "K":
                self.cardValue = 10
                break
            default:
                "no such rank"
                break
        }
    }
    
    private func getDescription() -> String {
        return self.cardLabel
    }

    
}