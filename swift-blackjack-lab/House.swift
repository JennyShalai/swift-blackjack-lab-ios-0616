//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Jenny on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    var mustHit: Bool { return self.getMustHit() }
    
    override init(name: String) {
        super.init(name: name)
        self.tokens = 1000
    }
    
    private func getMustHit() -> Bool {
        return self.handscore < 17
    }
}

