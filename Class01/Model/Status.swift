//
//  Status.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Gloss

class Status: Decodable {
    
    var health = 0
    var attack = 0
    var defense = 0
    var spAttack = 0
    var spDefense = 0
    var speed = 0
    
    required init?(json: JSON) {
        health = ("health" <~~ json)!
        attack = ("attack" <~~ json)!
        defense = ("defense" <~~ json)!
        spAttack = ("spAttack" <~~ json)!
        spDefense = ("spDefense" <~~ json)!
        speed = ("speed" <~~ json)!
    }
    
}